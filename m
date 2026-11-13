Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794605480;
	b=MJwKlYgxGWDuhZPPu+4C7r2Qd4T+cNyEnCZzTiBnBbgO99cHdCGbRxbpuT2t2flLOjsf
	 cbncWGfC2HXFhOOTSHtsEP/KQ4TV9N/v3fOj8SDi4RpyWl1OY2HM1V1LKd+A29P4FP2Pd
	 /31ebjTDMp0LBBmSh4B7vj5DX0S3dJr1PuXqYIwL35i9vjirxertiWIPKQmpQLZMimDj8
	 aTPJzhsW/7Exq6+7+bZcOBhqG+s+aA1zYR5OMWxmwuF23P1eAqOV3iz09MKQ3fLs5VD06
	 W76f/HB5dXVBrkx9qrF1/KSdkyAleDhVhT50DS4IGA4FUDuippZW9gMNoL0j0Yc7NFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794605480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
	b=MiO3yEFiHsYf8keT1nem323pHj6cZ2iDpQGcRNpTdY/A96JXaPlGkzuREUcFBUlCIbUF
	 6tqbDZSuD21ofyXOu/C0C4O+H3y+0b13M6ZYQRLeRhIO9oqUwOeex0NSPc5eo8gidcToy
	 hoJXUmSzgIWHxtQ8mCc4oGNCxzC22jbV1a7M/qkHvb3fSgnUn4ZZQgv0SqISpDmvddiEz
	 vI6ZQHsmB8497buoFxfq1QVu3HDW9Mlj0lvH/y3fZ3I3JE6mZ5IAK/yA+cBi67Wf1Ak5O
	 I/1MYZn2GJwAfxLO6P8/oA5zORuPoMKwtO64n+qJrp0VRFeF7wiqunH/+0bATNbMJbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iXISRmA+;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BC8606A333
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 21:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BC8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=iXISRmA+
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490f38e9688so1014436f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 13:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794605479; x=1795210279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
        b=iXISRmA+oktDtrSv4kMbnArkrGEcskye3m/DKWMCHC3TWyVdckPnyUctcpisWOiEkB
         sMVbcaILkheEaGTGyIknfeMxWCMVG9EDCFoIxLwY8PZv/YW4/EybM5Z6VkGITfmSU0l/
         ymf5zvwoZur1gbqZef7QlNw+/jqJCae1/2e4E8jqEodtr9rrYIuh1WU4SVTTs9WV08R0
         VFiYpo8EX7uxwTjXipkDm94WVOLKYE4AWLtO3R1LZyr0QbXgpt9uHfy4nQlBnWSFUdBr
         hYLEUdFGx35sr04h5U5gbSECsGEKti1kElQ830u7UwVGVI2F1VZZjkS6TmWilQecauRs
         hMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794605479; x=1795210279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Z97KMLhks2eUt1zVFkZTVVZd8kDUivIxgxGyFdw6i8=;
        b=2jaYWEu9RNuxgZX3vcTXT94dvhQSaNLXF5a0ktvOEIEZXV3Bm+tsOIIM3YbmSnv5bg
         lSyrVTo3/n1JiVoOvJl30F4hcZat3svMbRLMKU2cmnZEeFoPHiP6+haXpc30xP0ODKEE
         uPVV2mdIAZQpMm2agIeBmN0il52MOprkK2E/3RmfDCTMaPOs7ObdPMVnQeTJu/Qrs+b/
         nIvqlBtS7f16p3veYwfqIpQrWK8W0VViQF0mqRHWRl3vBnhzQKB+6FT0YPk4EZBH9snu
         0P1v80C3M4sEvvly8L1Yck8JdLKhCd9UPXEH+4aYEbOWf8j6TFq7eEXgxnl45nFwieNK
         OF1A==
X-Forwarded-Encrypted: i=1; AL+hErEGg+LgtePaYVT8KW41r+qBUgR+ZdgxBKb3OP0cpLwcAFiNsPwmZifB8alQ1nKT0oAucoJiZcUu8Wk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NqTa5C2nx1Q/VQ4TFTsTNegZ0xooehUV+o/cOVvXXy1XxCODI
	hZ4T4hrKhQHD6B+92PPPR9oH0EXXrk66+wdj3fksvTy7d+xaJRtyO/hqlkFACzhHd9M=
X-Gm-Gg: AYBFou09z/xftfrOmJWkIJRBEAAEKRoqcDWZ7EqRt7MOUCb/Uh7XbyxNg1Glv6vtWbM
	TKmLS46OKHZ7CQSrDH7aRTNiLFDY+hXnvfhKmjdlzUrDhKwS0WXVLOjP6eXuVFWsb0M1ENRhOuS
	Xswww9zfdOaLewPveAUFh0xPzoPHtU+9iBB3MWoldKeIz/wqWOPrYRGC90g90Oxgfx8Bes8EZ/Z
	RN+uKRyzCHy0zV3n8dVAlc4zD8oXa0yVFppSOvjaNIjGJSQgFxp9//7tauDjoltUyYEJyzw9z7b
	1TmtsNrVNLn8zc01ZLy2hdWIgSvwPu/jEC1OWSCmjaGADxdfwdDj0kMc2L1REbUa1kcFOdEc16C
	rcJzxfQXpZl935FFqfmqxpubP9jDhSNHhVCTO9A66BoZ1/dBCS9ne4v8ikza4BegYdsGRlN25KL
	QoQ7iZ2jEkMAPzWJzObYz/sDeCt+GdkoQyMviRfaWg7ca0EkgoJ1ZiW3pl4on0LFvOQpsNUFmAF
	r977qC1Ivni7vyGIOltTy90INkhVBdH2zFoDYXKYAxevtX/k4nK0JxK52FSLbUqupHsjhY6bBBK
	3tj62EZbectBDWwP07HjVp9KIhuT/d9MQ+33dSFFcln4qNU2e0pd0WFO/wDedL2LBsjVGuefFQp
	Bir77M4yxgWQuMYfuANQJ+8f2lg==
X-Received: by 2002:a05:6000:4305:b0:49b:d8e6:1723 with SMTP id ffacd0b85a97d-49c6d452d42mr9891966f8f.2.1794605478667;
        Fri, 13 Nov 2026 13:31:18 -0800 (PST)
Received: from z13-ek5.local ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm7447727f8f.49.2026.11.13.13.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:31:18 -0800 (PST)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Fri, 13 Nov 2026 22:30:50 +0100
Subject: [PATCH v3 4/4] ARM: OMAP2+: ti81xx: use non-scalable voltage
 domains
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-patch-ektor5-dm8168-clk-v3-4-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
To: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Tony Lindgren <tony@atomide.com>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794605472; l=1792;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=IKFwMoPwqeJrJOd6paqyhsFrEgkIZs2drKUuLxdD8no=;
 b=AERHNgcVKZvhpwIQt1j4A6/AX353m/5rBEbtNJaMMfUtPJAmy0ZnFJTKThqFJVvq3htmRF3v/
 p2RyPKtI4iJBfzcDoXyR3witwvXGXrcp/sEgpjcxpBju2m8aSdYnfkN
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

TI81xx SoCs reuse omap3xxx_voltagedomains_init(), which registers the
OMAP34xx/36xx voltage domains for every SoC except AM35xx. Those
domains are marked scalable and reference OMAP3 Voltage Controller and
Voltage Processor instances, which do not exist on DM814x/DM816x, and
no PMIC data is registered for these SoCs either.

As a result, omap_voltage_late_init() tries to set them up on every
boot and bails out early with:

  omap_voltage_late_init: Could not get sys clk.

Adding a "sys_ck" clock alias would only push the failure further into
omap_vc_init_channel() and omap_vp_init(), which then complain about
missing PMIC data.

TI81xx has no voltage scaling support in mainline, so, as done for
AM35xx in commit ddf536d0d7e1 ("ARM: OMAP: AM3517/3505: fix crash on
boot due to incorrect voltagedomain data"), register the non-scalable
voltage domains instead. They still provide the "mpu_iva", "core" and
"wkup" domains needed by the powerdomain data, and
omap_voltage_late_init() now skips them.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 arch/arm/mach-omap2/voltagedomains3xxx_data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/voltagedomains3xxx_data.c b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
index e98a3f289c27..478f5eb2a17f 100644
--- a/arch/arm/mach-omap2/voltagedomains3xxx_data.c
+++ b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
@@ -119,7 +119,7 @@ void __init omap3xxx_voltagedomains_init(void)
 	omap3_voltdm_mpu.vc_param = &omap3_mpu_vc_data;
 	omap3_voltdm_core.vc_param = &omap3_core_vc_data;
 
-	if (soc_is_am35xx())
+	if (soc_is_am35xx() || soc_is_ti81xx())
 		voltdms = voltagedomains_am35xx;
 	else
 		voltdms = voltagedomains_omap3;

-- 
2.56.1

