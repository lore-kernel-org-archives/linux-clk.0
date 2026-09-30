Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7721651FCDC
	for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793628; cv=none; b=GhFA55wT9wkkIpz+9vhikOgMtCrGZUOSy0cEESHTjMwGDYD1WOvfj0qgwjA60BnpE/CLaNOsZ6NebzOmfW++lNX9INvJSYoC6KybJ9QCAWWaOqaN7tfjfigs59zEECtYvqOPeHY5VTdJLLiTU+lqCz9ADqLiwpvb6hYBh0wxTc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793628; c=relaxed/simple;
	bh=/eAsNFmdRD3KMvqY5/JQh92RvC7n3+pvPqV0rpDz7tg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dt9KYAaVnVLXGBTOopDJ+N35YuKlkJluHQ7dZDH4zyJUgn0Jl4D1bisffCYot1+xjpFifqU9mwF8GpsVhK5diUsn7kzQQHqPXaC7Pwn5J5hrpjSQKMbvUWDNa74kmsiWOdPA9NVD9xkj3CCpyvqfc0KQqcpvIFs2AkWkbZA3miw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FxbHUEes; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FxbHUEes"
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-48b0622cc90so130507f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Sep 2026 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793625; x=1791398425; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sudsrgh6olVvguill/NXjWeyuYPJdT70+yOGXWlPI0g=;
        b=FxbHUEesuSR2NnhOHoUkAzLodBpO010qbQ6t99sEZj5CkJ0eOo3kevS0rIRJ/qc0H9
         TKUGci7+aY4l1JpExn/brfN/Pihw5C+95LtXihFK5KvS8MreI7kbRbxHiFsDHhnuKxuv
         DrvSlMfN7aIomiXFaxzJvQy9CwSIMKI+eMvX9RZ1QX69NmmH2B2gOI0I1v0glAyxp2eZ
         c0hATCVMk7kIYCtNGNAuRJ50Ju2yFV1V4T1F5GAvRXgKjrgg4zB952yNvlHVp6Z0Mj+l
         pb8sPIKbFagTcd8VKo19oJdSGOqWaybPLy6m1Q5p/jh+Bq4jQvZzpR5yyGgHVzmtxMcT
         /PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793625; x=1791398425;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sudsrgh6olVvguill/NXjWeyuYPJdT70+yOGXWlPI0g=;
        b=0QCRLh0wdUlK6BvWppctqlYGLv1wO22Nim9AVVHwGpmIZF7R6lO3WJcawvmtyfslYA
         Ty5DMPmlHnc2UHw7bI9mJ2alVMkfurofUNKh8nfj7K4gnQBwWHsLsfAgLzZBw68ilKtI
         LeIVQBR5nFDayDGanlQE7+DOeK2B7xII+YJoyU473Sm/gJmDO+x/S1VffjIWdW6bTgLc
         phz3nxJqEWxRtk8CsN9B8C1qjGiZeDLKPkUlhPmPKfqTRMm7pW5CmKSlKsBRfWlcd9VT
         wMR7l9MWPWHQ1dpxn8kqF7EmvnZpTQbMm8/aKWHF+fbbXGRJ9mDoA5CW+vsmy7JIc/ea
         zYPw==
X-Gm-Message-State: AFq9FYKTprD2yutUoFhAizZarrNmpbbquLUjx6sGp46Mrj3oVy1xLtL6
	J6JBjtgNVUJ7+J8o/jI83qkyz4h/sk7RryqHAqjjy39RQ8Elsj6zdkMU4UT3yv13nZc=
X-Gm-Gg: AYBFou1/MHxOVVmjpikH7t22+y8r6l5VQidrkvNaGP1csmj/y/sFDUmd1tk+SDI0n97
	scnQvkeRn5EiVHe7TlWmdfeN3klzMaueT5ugwSQH/Rc7oA5CxHAT+kmFleE5OSeWn/oLANB1wN3
	++McaiLu9ZTMrZW/3lhQS27O011rzihyl0TwtIKUuxG5HSAeMSejbLo53LKDJsMX8+HzvrZ7kSS
	gx/mgbgRZvTrMFZVCa5yOyzx02KxRfDHkKJAdv6piMuLgWPPJCgMlcPjW9hkuj7HLSzXb/Nhgdy
	Qhhn+el5czjlmb1+AGsyk7juSsehzHs/ahV2kcD5s962Jsk7PGsU6kPSlK7X/fjXzvPR8YgFUQZ
	g6yQ2jwtIN+MTLIjhs2lhc0R1+JCTyKJwKzuTGdmpT2+Oz27ejqyv+tkJkqZi+kXE+PPprUJr7j
	7NnGV3gGA0+PEbDC4RU4iaQ7bpRnd5IMEPnyBE8gcuJC5nKaZ1Rrer1stUADDAXZwIy6FKZFx5j
	CdM19XBMDk=
X-Received: by 2002:a5d:5d0c:0:b0:488:8132:143d with SMTP id ffacd0b85a97d-48b024df747mr4886436f8f.19.1790793624363;
        Wed, 30 Sep 2026 11:40:24 -0700 (PDT)
Received: from strix.localnet ([197.250.96.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6c1sm1063999f8f.13.2026.09.30.11.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:40:23 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Brian Masney <bmasney+clk@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 mturquette@baylibre.com
Subject: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:40:12 +0300
Message-ID: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartulVVFYPFRfOzbNRxaXxRQA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartulVVFYPFRfOzbNRxaXxRQA
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-clk@vger.kernel.org
Subject: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Date: Wed, 30 Sep 2026 21:40:12 +0300
Message-ID: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
MIME-Version: 1.0

Hi,

This pull request contains the device tree bindings and clock driver for ZTE
zx297520v3 boards. It contains the next step in adding support for
zx297520v3 boards: Documenting clock and reset manager hardware and
adding drivers for its PLLs and clock tree.

The patches have been reviewed and carry appropriate R-B tags by Krzysztof =
Kozlowski (bindings) and Conor Dooley (clk driver).

The PR does not contain the MFD, reset and device tree patches. They
will be submitted to the MFD, reset and soc trees respectively. The
clock driver compiles without them, but won't be instantiated without
the MFD parent.

The following changes since commit b1470947e92aeedd522ddb7363369c956e55d6b6:

  Merge branch 'clk-pile' into clk-next (2026-09-29 14:14:32 -0400)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-clk-for-=
7.4

for you to fetch changes up to 89e2c0fa481f6a0da23ad5c4dc98bcd940f09fd2:

  clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-09-30 20:03:=
29 +0300)

=2D---------------------------------------------------------------
clk: zte: Add clock drivers for zx297520v3 SoC

This tag contains the device tree bindings and clock driver for ZTE
zx297520v3 boards. It contains the next step in adding support for
zx297520v3 boards: Documenting clock and reset manager hardware and
adding drivers for its PLLs and clock tree.

The PR does not contain the MFD, reset and device tree patches. They
will be submitted to the MFD, reset and soc trees respectively. The
clock driver compiles without them, but won't be instantiated without
the MFD parent.

=2D---------------------------------------------------------------
Stefan D=C3=B6singer (9):
      dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
      dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controll=
er
      dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
      clk: zte: Add Clock registration infrastructure
      clk: zte: Add regmap-based clocks
      clk: zte: Add zx PLL support infrastructure
      clk: zte: Introduce a driver for zx297520v3 top clocks
      clk: zte: Introduce a driver for zx297520v3 matrix clocks
      clk: zte: Introduce a driver for zx297520v3 LSP clocks

 Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml    |  1=
01 ++
 Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml |   =
98 ++
 Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml    |  1=
22 +++
 MAINTAINERS                                                           |   =
 7 +
 drivers/clk/Kconfig                                                   |   =
 1 +
 drivers/clk/Makefile                                                  |   =
 1 +
 drivers/clk/zte/Kconfig                                               |   =
28 +
 drivers/clk/zte/Makefile                                              |   =
 6 +
 drivers/clk/zte/clk-regmap.c                                          |  2=
37 +++++
 drivers/clk/zte/clk-zx.c                                              |  1=
92 ++++
 drivers/clk/zte/clk-zx.h                                              |  1=
37 +++
 drivers/clk/zte/clk-zx297520v3.c                                      | 16=
57 +++++++++++++++++++++++++++++++++
 drivers/clk/zte/pll-zx.c                                              |  5=
76 ++++++++++++
 include/dt-bindings/clock/zte,zx297520v3-clk.h                        |  1=
54 +++
 include/dt-bindings/phy/zte,zx297520v3-topcrm.h                       |   =
12 +
 include/dt-bindings/reset/zte,zx297520v3-reset.h                      |   =
62 ++
 16 files changed, 3391 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
lspcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
matrixcrm.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-=
topcrm.yaml
 create mode 100644 drivers/clk/zte/Kconfig
 create mode 100644 drivers/clk/zte/Makefile
 create mode 100644 drivers/clk/zte/clk-regmap.c
 create mode 100644 drivers/clk/zte/clk-zx.c
 create mode 100644 drivers/clk/zte/clk-zx.h
 create mode 100644 drivers/clk/zte/clk-zx297520v3.c
 create mode 100644 drivers/clk/zte/pll-zx.c
 create mode 100644 include/dt-bindings/clock/zte,zx297520v3-clk.h
 create mode 100644 include/dt-bindings/phy/zte,zx297520v3-topcrm.h
 create mode 100644 include/dt-bindings/reset/zte,zx297520v3-reset.h

--nextPartulVVFYPFRfOzbNRxaXxRQA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmq9V4wbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxois3cQAKOqW1nSvwLMITtTcza2
Vdp9CeR6iivrtbKOMsiIk4809MI5SPaDrZFTRhGptF1lkghAVFzE4/C142dNneqi
WS1IWjBaka+M4nOj8ytObhnAw4aDfykrhsTbf728cm5NREgu40tbKntocyBAVZ/9
lhmCkEYxNdFf9XmkdccrWzFzz0frS76WMl49qqGtKx4wMHLyy5if01smKb/s7++d
N64P2US67mjeHpEARXF59w57dsyBJeBOO52m/WvN2SnBE6RDdczhOSyhxVHj/TMQ
UdhoCB/8qBLeHgiMXlc0E6Z8/JepjhF0COQ2N47RQ68hwl3u1jFQdOxuGVvhUKOG
WYqKt43r4MLjBv9IInWAhT+C0hUrNeJ+sM1nnVQcnLW4liwjl4x2FOxGRjqnvKdq
b5tIcljluruQuR59Zm0v0EjPxEAcWCZdC635QIkSpkTaLdQAS2jJ5vkmghy6v8Bx
Hjn8zxLFFeqoyhUOtK3d8JXvAWh/OkA+TgC7l5pbPqe8utUYyoT157nsTu8cVMHj
hZbZpr9dUpG5SH8kg10o9QPqIXPAhaqJtPSNFKEu04mhtaCcrbMOlo0c9gJBjefW
UN/hh2zY88uedgd0O+QAdSe+DAJQ5iZ7ZRGcP6Yx9i88QNepx5BZFGueC9v1aWls
MmfTH79WEXLfNxj7sch8COSO
=tmC8
-----END PGP SIGNATURE-----

--nextPartulVVFYPFRfOzbNRxaXxRQA--



