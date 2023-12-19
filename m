Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273BB405CB;
	Tue, 19 Dec 2023 23:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="h6ExbMcw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703028291;
	bh=NfojZdBYtn8K4phNnfsDm7MBtcodcBZZhB15plGzQf4=;
	h=From:To:Cc:Subject:Date:From;
	b=h6ExbMcwdWLnQWiJUaUhs3NskkB0eJzfxyyyuz1cB2OPPSPD0zGvn3EvNCi1hxARD
	 X5ONLBlrza468ZTLSLfOPl+5eNJELC3I9WwOR5dP6cFpuS6J/JM8UBAupipADkkYYF
	 aT+NFfvEu3/53BxAC71vs583zLWKm0CtQH2iErVRSXaNMTaqr4xE7MXnMz2c8PDvs9
	 b6/PHV+ucAYgAKYonCSIaDesRoB72v/qkPZ6SO4NXGs5j/juiR/WYl/jnK15oDbikI
	 nfuD9IIl8Y0EJkZ4xXzb4fa863iZjksrXCaJw790foRLUNDoj6sT0xhv0X6m7eLxsh
	 EfBH7S//iJ4Sg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 192B337813F2;
	Tue, 19 Dec 2023 23:24:51 +0000 (UTC)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 0/2] Clock changes to improve dwmac-starfive ethernet
Date: Wed, 20 Dec 2023 01:24:38 +0200
Message-ID: <20231219232442.2460166-1-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is just a subset of the initial patch series [1] adding networking
support for StarFive JH7100 SoC.

[1]: https://lore.kernel.org/lkml/20231218214451.2345691-1-cristian.ciocaltea@collabora.com/

Emil Renner Berthing (2):
  clk: starfive: Add flags argument to JH71X0__MUX macro
  clk: starfive: jh7100: Add CLK_SET_RATE_PARENT to gmac_tx

 .../clk/starfive/clk-starfive-jh7100-audio.c  |  2 +-
 drivers/clk/starfive/clk-starfive-jh7100.c    | 32 +++++++++----------
 .../clk/starfive/clk-starfive-jh7110-aon.c    |  6 ++--
 .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
 .../clk/starfive/clk-starfive-jh7110-sys.c    | 26 +++++++--------
 drivers/clk/starfive/clk-starfive-jh71x0.h    |  4 +--
 6 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.43.0

