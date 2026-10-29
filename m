Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793278470;
	b=VYTrC//+rKuokC6HpQM6+lrcObphFa7IdXKU8Wq91XKp3FUxw113Z4HvG67j9Vj9NDRP
	 ccbiDvo32fb1AJKRv7N0e4ljYwxWAAuan9SlyMoBOBykG0vI+u/0T7efiBeNyqz9lWst8
	 mYOtT0ro5MGQ8/qEPS4CYMD4KywHCB/TTRVjnnE8i8GPHXu4xjqNPexLI9IjQa8DL4Ha6
	 xh+ti1e0Zf0esHuUBUCGh7ocRq4wJ6sGB5BMRzA9gXNjgQZUos64K7drT42OXznoOhKBN
	 cjZQ7hkwlI7goLiF1IiwzkziIx8q/L1R/dZRXMCJVqY5Je61Y1RnTfqT2y6bjQMTJkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793278470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
	b=bn9hbT6pb26ikfiWG++e4AvzeZejDX/rEhN5bOHH6dfnq0dKuY7QfBRNXRLSKc8LUGs/
	 x+2EPxsQSDjZq/ICGknO3DgNJi/aY1TJQFs7DNHhLwMYoPzpBmFRvmec78PuBZLCOgCIu
	 VrxjqawKpofABemHfNr0Nqxa+KbRKxqrsdzjnzPwv1KPPKSXgrmm3Gd9ffg/6yjOkVpZp
	 EaqmIjHTmn7wrZAx5mK1GbZkodeD4vePi7upHj36NROGtxzYTMBvrD3NaCp8AB/L6k0iQ
	 RDAjnHBM7WU9vuUfHL41vZIxR9h2OsfIQ9LJMuALLhpan5b/JCJU1z4P9b18wIpNyjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DfDmthz2;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF83606A31D
	for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 12:54:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BF83606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DfDmthz2
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1035206f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2026 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278468; x=1793883268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
        b=DfDmthz203DVEilCItT2IWB9LdNbSNUFEdit0b4o8ZkhdWvDFU7dx/CUKR0IgwidIn
         dETTSM6gZmjbtpSQoLs+FhRB7y5IseeE510Mee/mi+LIAgqQpZuvqLDYRoV2spkvOOr/
         3q1iEi4AAnPb/IcnPzqFtMZEOrgZekkK2mgMuM0Nu56uojDOYgOveUwjagSBMYEv0h0M
         jCXEo7M34jXvgVOymcwdcVa+zHyuipa7lMWUYmXydd8WU4ccelVnXDtS+rGR9EKmwY2A
         gpS4CMxm4inR8ly56ug0xAvd874CfmImbS68ygmpbeuxtKtgzL21/fk0GlH7G3fnGSoI
         rTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278468; x=1793883268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mDWvJ/spQ38SUWYEopGVk8Tl0kmsuPeTE8Bb7tZRtgU=;
        b=FwEeGC8jkv+U06X25JmTSmWe8015hGM78GAV2AHN1tGuaz3gyYnc9/sqM3DbJmAey8
         4pqAe4/hDyrP2jwKJ+YS3s+AcXtJ4oXnjW541mSVwOOez8V7YV0gJdUpdmIyrIaGUt8f
         LXHg5h6KFb+2E+wLrt10lb8o0XTzU6RdX3rE70thVy299hCPpfsMEqX6PGe8mQo21vzs
         yx4yFgZB4t/hHnLR9q/2mmLIjH5IxqUZ+d6pPBXjvTuCx+jmZFtg6jV13TNDKEeAZHln
         SHpjM3EGNOBOqPJ7f6L9B6mvp1l8F7q8ZRAEFDtbv5MZYUqV4JkMdeJrn8a9lSks0Uc5
         N/wg==
X-Forwarded-Encrypted: i=1; AKwUvBzhr8b/Eh3vKNT92a4X5ejvpfr1joAsIGMmMJd1ED3D0K2QYVMydhP05eg3dsDrZYMaKThFyZ3s584=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkRQH4kvyV2Zl35qm0jqDUae/I6Dd9rU7h5V5h/PuitRAA5+Ow
	vJ7Y66L3UQs0cP6IsuqyQdfCz1i/UTBdwRn3WDI/XfxfxKSEYsjuHZCoTqGJJ9y3uTU=
X-Gm-Gg: AYBFou3W8jkMN14Wmbk0FZ0gu/via5PxycpRMULp+Mz/0jMSswxECgnToxTt2j18lMM
	oUc4q5FsuzABDfqMO4MmsaHzc5G0GMnK0hoTyLqnOXbr+4EtV06Lz/iymPPgLGQ7hGcaXJpRNQY
	ljVirFNIuBrV5YSOQ5ELMdKeam/9MxI8JvO24Uk4lcIwe8xifFWkLZu/FS5mgq63Bd9vCcoarho
	yvo29ij4iNZFC8dEaZ1feZCxZ/M6sXLH+vdsvGYEVckE+XpE6VIEEBNf0m4/zdPdFDUVf/hRoeC
	NQsvoUw4mS8GatbhWOMMDAt26lxQILPCQCxXY9zd68wSEEGL2zHZFyVlasLnvdmP0BdOxcU5gcI
	kFsrw0OdDQBA6N4tIwcASCY8sIBDgjBR7Q5xN2bEHvWMmyLld3DQkkixZwHOdmsMVnF75+hsk9x
	d4lUe9rKPi6guUmr8d8Cb2ppEYqG6V126ieh7E69d+/6n/J24ATfaCnTYoHtsqD15U0Tkwewbdq
	HJPaamg+8yHZDkKRPgBjeohrvUr0C3Qjy012q3HiELqjGtsbFbw7revcHSaVzUlwYgYG9d8lKVw
	6fwjC9pyyx9NB0QTN38Eut5no+L/FaMDfe/jQgkriLuKTXt4ynDOwEqu15wPt/tImy6LLWzHjM+
	y+yyFa+ZUiWI/4e75sK82HTlycebov4+oTxFmTui4NX7OhTQOBWg5T6yiL7IXtkO44DuA
X-Received: by 2002:a05:6000:29cf:b0:48e:2a04:4ea3 with SMTP id ffacd0b85a97d-48e5d284e09mr8938581f8f.8.1793278467853;
        Thu, 29 Oct 2026 05:54:27 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:27 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:19 +0100
Subject: [PATCH v2 1/3] clk: meson: gxbb: add the missing HDMI divider /4
 alias
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
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-1-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0

On GXL, HDMI PLL divider values 2 and 3 both select /4, but only value 2
is listed in the table. Reading value 3 therefore gives an unknown
divisor and an incorrect clock rate.

Add value 3 to the table. This also avoids a division by zero when the
read-only rate-rounding helper uses the value read from hardware.

Fixes: 5b1a43950fd3 ("clk: meson: gxbb: Limit the HDMI PLL OD to /4 on GXL/GXM SoCs")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..8cb6404c0efd 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 /*
  * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0

