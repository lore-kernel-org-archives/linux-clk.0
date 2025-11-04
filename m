Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C1C33554E
	for <linux-clk@vger.kernel.org>; Tue,  4 Nov 2025 14:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268313; cv=none; b=lYaVJcGnqNCBmadn5/W2GnFc9lYEIF+cYr9O0ViIrDcx8S5P/hNa9MMF6muoo/5meZRIce1X00MLz+nZAtdGca5tLDh+fKKLhTH6hw1WTtDp5NO016snlongOCpFE2uLzpSRIZicGyms5uFeOIBbSh+ML1p/EMVehU9BCN0UIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268313; c=relaxed/simple;
	bh=W9g+YJ6BtshhuZpzIE3hQJ772deNaUpm9Z9F4iVdSVk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U+0HpEcJwdYaV4E+QrmKI3xEx7Rw4Bhoxlrx7kFCZNMAFigx2u25kotXHu1c8gp7iKS/EfedRO6GG+uUwTVEU8k4XYDY+mzdO2KsDaJqKYxYuJPcLYvA5hndpGpqqlEUzVv3ab7EpUFY0rd3ehijNcaSBPlxVNmVJhegsoiOsOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYmW0PZi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYmW0PZi"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64074f01a6eso9221550a12.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Nov 2025 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268308; x=1762873108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8yDoZvnl9i2PCVqQpO58zWzoD91W2IfT5tAZBQV3TwY=;
        b=RYmW0PZiAx88z+3Xj/OA9RvHi5JsqA6OHbwOkDW/JlNii+V+/M/CfZh7gyOGClZnm0
         pAu7tf3Qy549y4XfixE8BYUb51gOrok4NnXl9jlb1tmtzvDiU8y8aUgPs7nv1HnTE5dN
         edR7LP9Lt4qD2L9O0fvQCx6+729fcTdVVaWtsWvw0INl0o9nSz/qKAm4jWlxd2vIMh4M
         /a8wUguHUpq3Dxiwyi6vkNGq8HL8/OLzZmroIaRK0O6lY93Skn0LamGOd6YlZk3KXFpQ
         DhPnEgFq4vHMxQmse3S8pn2RSaZEI6PFuRr1uFpXa6TnYJnNqlfq71PFHJgVhemOVWT/
         3+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268308; x=1762873108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8yDoZvnl9i2PCVqQpO58zWzoD91W2IfT5tAZBQV3TwY=;
        b=uAzHu9USruIHMIFkcsI745VYc8G9uagR9XWzp1uR0e2gMl45fXYpUpZE29mSSKKKFA
         qH5zTaT32K08Lqn/dt9khRDXfZPT44poSRpqpficjH+gBb0m69+6MQJjSEPWjK7sdMEw
         yYX9/InQyn+orbSURB41Pq/tyINyXCwo1qF8DcE3OQ26USqlhpARkAAtxL1HBR4plX6H
         GneoUpYekg9IV5sqAafednovZ90gKR6v5qBQXc2PWQAOZVttnRNMr1+La6/mU6oIpocn
         4KcnIlijCQl+m6edJZ8hOI79nLAEfObp55NJMb5OLTvsZfGjJOQO/xhmoPj5C3TdbJvs
         KJHA==
X-Forwarded-Encrypted: i=1; AJvYcCVclHuK3FqIEo2oVHwV80qlWmWX+fQ+286nZXj21LoaozCvOEXHe1F4L635Ol3CAc08i1C+ZRoOkFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfyFeNoH2/SNKWM05BDBMncSM8ON2DPVOFA68UNvEb5gBGAyPg
	tXJmcGfjjJqxiByY/pcuUp8X4W3qA3KGb/6GgA3tvvS1dKCigougmz7D
X-Gm-Gg: ASbGncua2CUXgRSTEn86uqt1w2jODyARTiHwxjVGpO90aOQl1aexUKT6hlLjeJ1E40V
	wW2gTe5qP1s6Gr/qeFH6DtvR2nYLowNYseMvplNSB+PlRvbv2GUMOkl3KaXRNL280GI/JQ8nrMz
	DtbTRqAmbjiLARPinnJ4NRuFGdHTGWB7UlSworxDDVOiYt33eo4aqpsrQ8Dw2+D7L+V6rfOc6jb
	W/WYzi6S980hxd8HOWphJX45FRrOCBVnh05uZKDSIgmLiY1+WcfB5CGuj3hqauLM7u3oBNUIp3u
	ni2hSgq6ss1eVMTh15or+aOaXWEch2Q1ewjlHd3Sgqskh95jezdaGSQh7WHMD7GkJ+hLIXsA23s
	fvnKQAZ7Z40o2t8Jor2m7yFMPE5M+Jvnaob5ATWBBVdCCuhXD+AC3vjVQWwYtVzXMtzbv8hXfp8
	sziSk8opzPLYPhhK1jlXbyED/F4nf4vLOJh3ktFuMOqdCRBmM=
X-Google-Smtp-Source: AGHT+IFs9W8O44jy0to+HH8P36ANszj/+KkeaTelvysxmEQV/qsf42k3TLW8rGxbLiSoMryUWBJ0BQ==
X-Received: by 2002:a05:6402:26d1:b0:638:3f72:1266 with SMTP id 4fb4d7f45d1cf-64076fa052amr16212580a12.16.1762268308065;
        Tue, 04 Nov 2025 06:58:28 -0800 (PST)
Received: from tablet.my.domain (83.21.17.47.ipv4.supernova.orange.pl. [83.21.17.47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7fcd7sm2288874a12.37.2025.11.04.06.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:58:27 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Tue, 04 Nov 2025 15:58:20 +0100
Subject: [PATCH RESEND v7 2/7] dt-bindings: clock: brcm,kona-ccu: Drop
 CLOCK_COUNT defines from DT headers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-kona-bus-clock-v7-2-071002062659@gmail.com>
References: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
In-Reply-To: <20251104-kona-bus-clock-v7-0-071002062659@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 phone-devel@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=W9g+YJ6BtshhuZpzIE3hQJ772deNaUpm9Z9F4iVdSVk=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBpChSNyhoRHcTk8Z6URFMUuRgH1NYbfHNCN3nuz
 TT5s4TYN/mJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaQoUjQAKCRCzu/ihE6BR
 aBZ8D/9GVrJnnbshf40Fq7EmWfKlSWadlwmZGigXl4snbvnPs6gFtD53934e9ydLgHRjv8u2HF6
 v3RetY0M1wonst8EpeN0+FuNakSthGOt128Yc+TgylDcybfRojzqe5x5QgzXnKnd17rLN4PRzZk
 b0uo3WfdvbegZCL6sTFjVIRc0186+231PoH/YXcwJEM32ltp/EKPAB3j26sIfQ6Fx7NJLkHbFhm
 F0YXJrGbjLkV8KYRV3xHTdDNTqZ7w/HZ2VZh69brnZptYURDhXlRehZR6/iZq5Qjt9dc1sKvh7o
 zTjZNyJy0LOeaxee4dnnGR5EqhiFycYqxrz1mXeb511qqn5qqrY6iq2ZAtSoF0gdcnkpkTpR6F1
 UzEJ3AVHAD8zoRwTv6u/EZ/pVyedM5nW0h2xCEx0tBZsGBjyRdPBrrZs4FHx03p8Glbo/dE+X/Q
 Islzg5UV4NnsdWM1pfAzZNzp1+frZq7Yz1BGpKUos9oGDmN+7qeiLqf7zQfmOsUa+EQLvevVbc/
 epSm5KUSSDLiBoNrTzmlXBjIwLFppBBuKazNuQTwja4J4ic23JMayyaGURMTtslUOr5+V8J0gkE
 DRJCYzq9mp2tk/wJmUWZ7jYqJfO+y3+JvxR7ZGYT5mLfLscGKy1XEiRu7tcjejTqLhGeskURnWB
 dpxZ04FL3Fn47qg==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168

The CLOCK_COUNT defines are not used by device trees, only by the clock
driver. Keeping them in the DT binding header is frowned upon.

Since they're being moved to the clock driver directly, drop these defines
from the dt-bindings header and only keep clock IDs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v3:
- Add this commit
---
 include/dt-bindings/clock/bcm21664.h | 4 ----
 include/dt-bindings/clock/bcm281xx.h | 5 -----
 2 files changed, 9 deletions(-)

diff --git a/include/dt-bindings/clock/bcm21664.h b/include/dt-bindings/clock/bcm21664.h
index 7c7492742f3d..7a380a51848c 100644
--- a/include/dt-bindings/clock/bcm21664.h
+++ b/include/dt-bindings/clock/bcm21664.h
@@ -21,12 +21,10 @@
 /* root CCU clock ids */
 
 #define BCM21664_ROOT_CCU_FRAC_1M		0
-#define BCM21664_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM21664_AON_CCU_HUB_TIMER		0
-#define BCM21664_AON_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -38,7 +36,6 @@
 #define BCM21664_MASTER_CCU_SDIO2_SLEEP		5
 #define BCM21664_MASTER_CCU_SDIO3_SLEEP		6
 #define BCM21664_MASTER_CCU_SDIO4_SLEEP		7
-#define BCM21664_MASTER_CCU_CLOCK_COUNT		8
 
 /* slave CCU clock ids */
 
@@ -49,6 +46,5 @@
 #define BCM21664_SLAVE_CCU_BSC2			4
 #define BCM21664_SLAVE_CCU_BSC3			5
 #define BCM21664_SLAVE_CCU_BSC4			6
-#define BCM21664_SLAVE_CCU_CLOCK_COUNT		7
 
 #endif /* _CLOCK_BCM21664_H */
diff --git a/include/dt-bindings/clock/bcm281xx.h b/include/dt-bindings/clock/bcm281xx.h
index d74ca42112e7..0c7a7e10cb42 100644
--- a/include/dt-bindings/clock/bcm281xx.h
+++ b/include/dt-bindings/clock/bcm281xx.h
@@ -27,19 +27,16 @@
 /* root CCU clock ids */
 
 #define BCM281XX_ROOT_CCU_FRAC_1M		0
-#define BCM281XX_ROOT_CCU_CLOCK_COUNT		1
 
 /* aon CCU clock ids */
 
 #define BCM281XX_AON_CCU_HUB_TIMER		0
 #define BCM281XX_AON_CCU_PMU_BSC		1
 #define BCM281XX_AON_CCU_PMU_BSC_VAR		2
-#define BCM281XX_AON_CCU_CLOCK_COUNT		3
 
 /* hub CCU clock ids */
 
 #define BCM281XX_HUB_CCU_TMON_1M		0
-#define BCM281XX_HUB_CCU_CLOCK_COUNT		1
 
 /* master CCU clock ids */
 
@@ -50,7 +47,6 @@
 #define BCM281XX_MASTER_CCU_USB_IC		4
 #define BCM281XX_MASTER_CCU_HSIC2_48M		5
 #define BCM281XX_MASTER_CCU_HSIC2_12M		6
-#define BCM281XX_MASTER_CCU_CLOCK_COUNT		7
 
 /* slave CCU clock ids */
 
@@ -64,6 +60,5 @@
 #define BCM281XX_SLAVE_CCU_BSC2			7
 #define BCM281XX_SLAVE_CCU_BSC3			8
 #define BCM281XX_SLAVE_CCU_PWM			9
-#define BCM281XX_SLAVE_CCU_CLOCK_COUNT		10
 
 #endif /* _CLOCK_BCM281XX_H */

-- 
2.51.1

