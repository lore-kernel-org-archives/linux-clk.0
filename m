Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793820312;
	b=ugMuH9dE1nHFSu3aZv5+jz5xA9kvlsfKFiuPjs010rr5Ka4ZHSDTQbZpSF+o9UvsPOlB
	 jUgColtvIbZIkHGakxwALGUqu8s8zHPgi2FR7Be68QCOYcg32/n9RzMXpUgNwB229RoPn
	 YPlfqnPdM74mxnCaV3aavSbJ7R8FgXDIDHgj7DRbfpKLApAAM0DEmmO5VArhNx4q2WgDk
	 N5VyQL/uSkkx96NAg8zRThCVv1H9Pyr/z36RG5UDJ1vtnBiXx18kgSVUgj4G/3wT3XB+K
	 jaHaDTOSP1NYVN7bUu/xcy9pNtMODN30KWMnsOAlMNjXh8V48aLjas6uv/LfbTpWCRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
	b=Q/hffablhwyZx/42DUXL20Z0gM1XKtPqUwcY17pYZUX0PCtMkAWW8m5zCTlDDonOFn8J
	 l6jNEPRRW9KOrGUMxDcK9Onod4WfgLZfm4bL/QWOOA3CWeUtKWIlHmsAMXe5k3rp3Zj2A
	 QNjC3/k++Feb6QAn39dx0YSdQLfCHtIyGKAlmSfZAw4JJ00YS/QSEZITEN6jrWBfyAR/E
	 AzvRHziYwr2ftPjuk0IEI14KM8/Fh1CIvROkoqbz9eU5I5Ud0DNYawa+aykjcsv/HfED7
	 QwZ9tOEFxifO24qg7er4Bqt4mK7ADFZLR4PGodPA++xtuGHHyfM4iewsyZsJvaSw40g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+q59A3+;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5D46080789
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 19:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C5D46080789
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l+q59A3+
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-55650fe1f0dso548828b6e.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 11:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793820310; x=1794425110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=l+q59A3+sOw7fKxiBQJb7McYT//0hRwvDg8Ct786G6Oy50j9vWzWGmZnEV7RHgdMWu
         98SHuZlY9XUQYHhg0iDB8rrqf6CjaScx0qFGzrVUN0aP6NK7YhnwwT8RGc6I0YOYPmz7
         /ijtTs/dmM4lZMndW+0EfVVvzaPyJMvxKkrZiE0N3yRt0lC8+mNAMspdIwrbCvG3R3LB
         un2KOxhfWDqnY13nwSBSSUqN83H1QoAUhTwyPLwvH7CEdDYly3uur2iMlYthKDNftoGF
         TErHkRGKcn0k6N6C6MwT6/0kSLXFRwfiMjdkjOMZkhK4PV+aHmUuewZwVzCuNNZ7bz8d
         1Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793820310; x=1794425110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JUJOd9ewD2XzFuoXefvfL/kztf8QXUFxcaNj03ZJSj4=;
        b=hXf95dWoH+DDRuyRd03dZ9SDKMFpPFYa29XwbwKPnSwe8/r/B3HIHnCkfGzTTkkDr7
         MH12MR8H53tl+FhPxJiQe25TjYqIt5V/w7+FF8vZUwR9GIMUf/aA+mtAmw2yGUp4aGMs
         ZtlQyOEhxVkPmCbjyFuDpBByzpk8ARmAmVlWqya1ylkQX+A2CaYmkRMUsdUlyB7Veh0J
         RTTnglCyQm3IgmusrLRImvl/ahMwoeuP6I1cqEPcdxg5Sef34QTyushlRKt7iEQ8TeGM
         pamzBf/djc/mhQOcqQr7guCXqV5op4iWfe9XPiF0ePiP4ciaAue0U3oONDRKZoZV1+3E
         7xnQ==
X-Forwarded-Encrypted: i=1; AKwUvByBt+ur+FI9O/e1QtELbp8sLvwgXD3xETp/+UlfaFpXclafFMumQQHJXziR4x2t6cyqll25a6v3W/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5VJUD2akWT0E0enweocZtUgRWgssz+07+mV440KFTETrjIs6H
	2z2qxYAEcmanTFUv2W8xhyyt3kxoR62vCT69L6Z2KrKWVd143PEabk2G
X-Gm-Gg: AYBFou06luG2VF/adj8/ab6mzMna1aJ040RFuPIphMPs3tOJLfl49tktJgKO0hkiNJy
	nCaCViMpoyA3j8r5ZxOC/TMl36jPAu32dMUwPmq+RtajKFKmsTWf5lwZQc9sf6PQFGoR3CF+RU0
	9RgJLHFXelr6F1ZQ+znPaymVBrc/oHHI2fjtVTV50RvsnTNHPKlVYM4Ez5p5ZiDO3r+ZI5hzUWd
	CY6fjNA9il6IdWgGreJYcEJNdxBT1HxmCbGgcb+x6jwfWAGA+A8USm8SSOPeDG0HonxiMI4MHel
	ox0Yxdv7KGRgSKOOJgjHVj47Nt1rWdSqU4m9PQjT53wJ0+8JfVSHVVuFujNDLkAuUz3aqP+IhN5
	5/uPe5O/TODDya1uLUaDBBY/Dx6GsKIuQqCgOYOGiU6DjJgdBBrhIMLdZ70MePXOrY/pYEGaqgN
	lqPyc8Tj02wTmpUPZksYaHrJrOj6TAGRsglcplZfV6nuzxLmWF35zZfWjwbC9+jE48q9rV9Bsho
	eogvMer/3ohhQqLTZRDzGRxAwh9h+/rhrt6ei8NlSTCyvD1DfgNqYXsG6lXFH5nza2bavg+C6Z7
	SQ4x3lcaWif+SHWudTJFw6ZfsOTMF5jZLcRS26N8mW7wUh9NwHkbeJWXh6NmY62R7/fZrOYC/sb
	50B37PwIHUK1CBMi6VOcr/KVy39DUi0j/eOzv3tBmRLCl68TcydAn0VaBKKYM2XzXR5INLGT+1B
	MzqT4FIXNyodNmX8UnBWob5aOkV4UkjlpC7NUU1HRaaJ3xcgP9EuPC
X-Received: by 2002:a05:6808:198e:b0:4d6:9293:9b56 with SMTP id 5614622812f47-5640de2e892mr13003756b6e.62.1793820310505;
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9c7bbcesm2328723b6e.1.2026.11.04.11.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:25:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 04 Nov 2026 12:24:55 -0700
Subject: [PATCH v12 5/5] MAINTAINERS: Add entry on Allwinner sun8i/H616 PWM
 driver
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
Message-Id: <20261104-h616-pwm-v8-v12-5-8ed39b0dba69@gmail.com>
References: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
In-Reply-To: <20261104-h616-pwm-v8-v12-0-8ed39b0dba69@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, 
 bigunclemax@gmail.com, linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Richard Genoud <richard.genoud@bootlin.com>

Add myself as maintainer of Allwinner SUN8I PWM driver.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..b80ae0ac5eed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -947,6 +947,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
 F:	drivers/hwspinlock/sun6i_hwspinlock.c
 
+ALLWINNER SUN8I PWM DRIVER
+M:	Richard Genoud <richard.genoud@bootlin.com>
+S:	Maintained
+F:	drivers/pwm/pwm-sun8i.c
+
 ALLWINNER THERMAL DRIVER
 M:	Vasily Khoruzhick <anarsoul@gmail.com>
 M:	Yangtao Li <tiny.windzz@gmail.com>

-- 
2.53.0

