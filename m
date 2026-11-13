Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581853;
	b=pvVWgSI4UJ/LlpGDUFtANLMmVxtho+P4KiWHo4C+R1PNfBd6r+GvMaLzJcFkNg/rsiLm
	 euOSOlRxMQkPPGUYyE8FblrzVti0tfmsBfEbjG5KJ8Nz09Y3i2FzCaFY3joKjw3L1RWrg
	 VFQ4WHbMTr7ca1TPYwUNtUg/NYsa42aU4EHdHjHxuLwfcilhlasJjlwX3zaR0sH+4wWqS
	 Y0CUJGX00Ytw7XQNTNeWtgXyPUgbqR+AfelOJhAtYR0icTXeWjoBF6n2TV3oE8YSUjHBJ
	 7Tn3wbnLZxPSSCGE1R/3bYpLH9g9Jb2MlKaDVDoROBnY7iLO7aWB5PaBEwdYxUFkOMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
	b=UrgfQ6WWGLtCDG3Wgc/FunTDPpa99LX0JB3dhebix97N7PhrQyMUJ0oB8OiJjF3fwFuj
	 JH6lthQZ2zVJU+9aHSRXZzIO7vovdetANnGs/B0TMfiJ9hlfuEbtih48utjDRzJcBfkd8
	 okBMdL+d/CJfg98CTHTnoQYpOSUUyX+4Tq39f+FIAvQbTFUlnJViI6ybiOjpfQnEnvgq7
	 p+onLPB8mwqAR4AuxpYiiBvJB3Jsv3lpCciZxB7tNMo0NWtwgek/p+b46ZDiowmIw8OvI
	 OTuqcmOLc2bACcqwUY5g0WyLvc7lBuMouA+zklw/eMQ9NksNYOAxWqrhCFOwJhHVR7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A30606A88C
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 14:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28A30606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso180437866b.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581851; x=1795186651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=owO76DdV+intecB+gfvcaXp9qFLZHPv1oqwmheQeztT/p+qKx7StnlQPrf9T9xHAiO
         2RUEOCFi01EIq5y6j/nq2SR27fG86EGMwVX1h+hljVpRA4Ijj5eR9Z0bgRIRnBd/LOUe
         86eVB9DZnbqXjO7xcBGYT20LQmmYCZBNTieEV/sUaNTZ/SPKG5AoAppc3pfgQiYzgL9I
         /YjJJ1gUA0RUmFDJ9xnWDxuRnpSeaQaavc0gCMehJtUUU68q1Jz56JAXgfc8FJ1TzUeg
         aCkcOZGNWE9I4STm6ZaDOqZFmmsstugQ6ug7a+7umu9UU7RsN4kdEYAWOEY0zGEKhb8Z
         1utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581851; x=1795186651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=IZgoYEVkCrG/gsTk4baIX+wO1Mt+GPCo4CuG2mqov6vtMPq0099W+mBxMmE3Nvavhg
         Ci6sZfE5T0p+O2R4w0An5PW0T15zHWVuUfOOZaWaXR5VoAEW1EUGT+rzTUF4tLdhs0Z2
         KKTLXu/vIkNJy7NKFKCaYnZEoN0PKWErfUfiT+dLFdYpOLs5PrQoVtr9ScyQ7UrzeSiH
         laxlbv2MemH+IX5wnarMRmfhYVYXbFNG3xy8CloGbQpSbuxUZRnawCt8JVYVyej7e3dr
         gGiPt0LUpzT1iZRx0fq3TFGiV3qY3xvooAJ1p9NQ5dp2CzO/CNpt4Q1g/4pfmNDKXxcP
         Resw==
X-Gm-Message-State: APuU4Z9D0dqSI85d81ml+J61cmVrjJmdTfNkcFyMQ9vn18FSm530Ftho
	dPtx2PrmCcoNVytCnmzxobs36Tp8bC6gHKQ+RUyzdf+YRyA/nLVbR6/5sutS0Q==
X-Gm-Gg: AYBFou2IFxZ6lls96Mz/3RPI4wxohK5q8DiMhbWUa1E+N34idDqXReZRDkxZgEqT6zF
	gEvxMhLI3HxngYkpl61n/gcq83Idb//u8e8Kf07UlCV3fvTz4AqN3wM23Wy0xmha98uo947GmEa
	qdlsi+TXpmg9a3MXZFDNNN+T53nNYqEGqgGFrJZHmrWPvCVECXUrMg9sW64r3d/ji9qQRG/PiFw
	Pt7LyslP9btEiASHUA+h6wdY2M6bEucVSbGClUp4lP46RZGH0pu1/TMRWN317FP/AT7P0HYCl6e
	iZGMjFJwfMtU72xK5JRgx26PvXOiPGtYI7TNMBaa5uNsn/yFefJYbyDc5+9mx/1ZFEYRYVU5KXq
	Ha7OHJ2qGL+SgS5c6ov/DJ4CfecdgKLUHrMdrLEhQLZfWhIsa3e5K1rkHPM+DmfOKmR/s6JDziV
	kJsHJc3IobsN8XjTAtwycuvwRe/hetTm/cVM2/s0EiZK6XjNDLSF/pSGD52MwJi9kCAWt10G9PN
	tXxQimSjmQjT3tJObcZ9VTZvxUIbMpuzPWxhZ1r3lxQa0SnYAsum65A73HGzjuZsWKDtJY2DAwG
	WdUxNvxaljuhlwgr9MPkju6pDONlFcHKSaba9Wz5/ZEyAe4RTYy6T0TbadbQnYqzuXnvrtHkWHy
	qRktN9U96aw==
X-Received: by 2002:a17:907:a088:b0:c50:52b4:eb04 with SMTP id a640c23a62f3a-c50962ee311mr275471466b.16.1794581851329;
        Fri, 13 Nov 2026 06:57:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:08 +0200
Message-ID: <20261113145708.261530-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113145708.261530-1-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 80b7f64125d92..e3d8ab76db649 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

