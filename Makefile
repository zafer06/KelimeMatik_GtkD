PROGRAM=KelimeMatik

all: ${PROGRAM}

PROGRAM_DIZINI=bin

KAYNAKLAR=\
    egzersiz.d \
    main.d \
    veri.d \

SECENEKLER=-w -wi

OLUSTURMA_KOMUTU=dmd ${KAYNAKLAR} ${SECENEKLER} -of$@

${PROGRAM_DIZINI}:
	mkdir -p $@

${PROGRAM_DIZINI}/test: ${KAYNAKLAR} Makefile ${PROGRAM_DIZINI}
	${OLUSTURMA_KOMUTU} -unittest
	./$@

${PROGRAM}: ${PROGRAM_DIZINI}/${PROGRAM}
${PROGRAM_DIZINI}/${PROGRAM}: ${PROGRAM_DIZINI}/test
	${OLUSTURMA_KOMUTU}

.PHONY: temizle clean
temizle clean:
	rm -rf ${PROGRAM_DIZINI}
