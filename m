Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99578309DB5
	for <linux-clk@vger.kernel.org>; Thu,  6 Aug 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786021273; cv=none; b=BLyCy5BnRBoXR7b2UtEnk/zsfm6qjo+TDXjNiZSK7/n4sjGVf6vJ9stR4/nmk7bUSF3Lh4tjFLOShpGm/ESIH49wdaW5tlgJGOiBOvue9ooBhPYVjL2xBH3WgUHyEyG+5j9GulNTLhPmUnwSExBG0Jy5tR/FbjdREmb/m8yInZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786021273; c=relaxed/simple;
	bh=s04HVknsUgxEi6jihGejSgB/TwVykML3ayZM3Cu0Ci8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=MEblkWr1TLSxtSTK2xEIRdTUUZQxaeebJm7+OsmeIc+zGgGG0qRDfB2U+7oj+JM23PvfojvPE6ZzCu6sbncfRqwLTD3CtIzLDQ0bt0jRHziMi3Lww/W1Fu6Dkild4OS50LEc0+AqItwi4zzLQI4SHsGQjQFxe5ECMkDzi19cMfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KHpvjunu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KHpvjunu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4955158f26aso14289935e9.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Aug 2026 06:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786021264; x=1786626064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zz60dwOt43+w/6UxrOfYd9SvtI6AkTQj3e04Pm3ApbA=;
        b=KHpvjunuO30xZWFfXZPS5EyWGKAsSUbROB3EOXsZ0cYJkVGMmE5dYIArfAy2ohxDlf
         Kk1prMsSr19HyRqOuFezX7bbnYRA3Mk1YOFHWdFF78/lmMsrzG0aywXczJulWLtzUHXd
         2/l0i4Moc3SJ2h60sBxNxqVJXO0lrBgJY4BrAt5/sCkmIoEn59/2moxOVmKE+B7tYqX0
         +MTxqGwTqa9GYN4p/+5eS2PaZcExTLdit+T/SHq7VN6glPQrcyAxNwO8qpbqk66yNKEw
         5I0/tYqEqPYtZmbDdn8uULu5GmEhtAjb0cH9NjM73b5HVwAbBGsgu5N93FU4pBvf1Rs5
         PqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786021264; x=1786626064;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zz60dwOt43+w/6UxrOfYd9SvtI6AkTQj3e04Pm3ApbA=;
        b=bORNXFKQm/t6UtCb2m5zQ4r5dT6SzvMtop7iT+ZS20gC7obRL/WI3zFVOJHdZ5bvi3
         j53ugCjMx5nwc+vDXz5zZugYMNWeJZHhvmjNduTGi9LY3ATTbvmRz4xOvK6SMcsuzOLu
         7VWS7usGLoTV9Hojtnbd2eJ0vOqADw/ZD48Yobwv5+F8WlDPWTMCETRelvG1U22qcdit
         il2roz/oSXxvMlKlzrSiOCAjR4TUo5MtdGQ0UYnsplP5gGs4Dcm4FcftNtuO7mrdPD3x
         4zQt3W6jjPDBlvYzHNXpVqiJqXhc8Hr198TjSA0a26CBGj7alykLdx3EAkBTTO98diyJ
         m5Ow==
X-Forwarded-Encrypted: i=1; AHgh+Rq8+0xIJrR7Vw1jtcplcfEiykVEJBBerACVHzxfwuoxt+91lH+OVARA3w2Q81FdgFeEh4HaBFQlPfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFNRUS2t5AS97RNJYmY3MWT+0q8IAkGZO3VvUms63AxHQqzNJP
	jiRTL4Ak7UKn6XZbY5TW1dRbC023i3M+H8h5y4Sq5DJy1Cjl/k7Z7eDs5QEpzK0g3fA=
X-Gm-Gg: AR+sD136hGXYgUJDzkciKNR2wvije9uZNxrC2dRd2PWP65itW077EASijIWKnYhRTJN
	iibGBP5tRSQcH5jv/NYVLL8f25KFd43ap7jRWCuk0qyZcofmeLmk4VxRCOqjjEydMuMtMdrvgQD
	nV5hBcd42p7EjgC3EayY8ihtKBfGDlLu+LSewbKsEcJHcOVfhCPlEX1109FdFqUPmdrsAJUqiar
	GjBCrUJ9Z0jHOzMeUHPXdQEhEeB0UMSlzeTwRB/g9zfmTn2S8HZIW+lbsVEa44RHIzvrd+MRKW9
	sTWkmHzd8sipFGt1VFPuBAAz4oMuZfGBSBq4B0JnEcu0MBgBmTfXrivz/1zDKg3fvuFq84/S855
	J9mc9bG2snG8WML6HvA0pnnGv71Ht/TPZ5Cexp33KubZQEoYmXDDdwu9jQYPU7A1+OLhUDil7NP
	HsTeeQn+a+CY96Vp3pFYFPRSZqRCr9HX7JHSvcnTec9LWNRjWjpQBQ6pQwCwV5YA2X51jzbMa+2
	uESpg2/RNeanbCQlRwnLys7KeacPFMb1wR8/gZgAuHpcYbdS/3D
X-Received: by 2002:a05:600c:4514:b0:496:bbce:f3 with SMTP id 5b1f17b1804b1-4994e71ed7bmr185444205e9.6.1786021264085;
        Thu, 06 Aug 2026 06:01:04 -0700 (PDT)
Received: from localhost (p200300f65f0171047a0a39ae84ac36f8.dip0.t-ipconnect.de. [2003:f6:5f01:7104:7a0a:39ae:84ac:36f8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4994e99319bsm102317795e9.3.2026.08.06.06.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:01:02 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] clk: samsung: Don't include <linux/mod_devicetable.h>
Date: Thu,  6 Aug 2026 15:00:50 +0200
Message-ID: <20260806130050.646488-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2343; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=lIHh+rvtmrZa4l9g5kSUL7C6KlSIiEKm7NmxxSo2pLE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqdIWCm3HPr0hCHAGrzPj0/DIS42a7yNxhWa3uZ VFUr97OGGaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCanSFggAKCRCPgPtYfRL+ TtcXB/wOB4MQkk0pa+l2wPt71bxqbbWzB6fo+l+C8SGGq7V68zVdVeFe+oshBLr8v/Ybi84XaGM asLUGXjlJxEOtGu6bkspgEh8vRvRVQghymOKjpS0RPINBrt8c1Y3MYKKYQ3zkL8vgGYm6+453SI gMe6glco7jsfp9eP7O44+PPR15Ph2kU5lkz67rMyfT+iNAQ3CSrfqEMIWUyooJO2ydGx5RTT/bX ADlcMPZhZeOBzb+Mypz/hUwSVGCRasgzjUVHwstfqOE5l22TbE/ElXt4MHME8LciGN06eFKlYRO ee/de81tsT9vPuqcMVm0YNysYjtAL1SUTeBf2y6o6IIf7k6P
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: quoted-printable

All users of drivers/clk/samsung/clk.h live in drivers/clk/samsung (see

	git grep samsung/clk.h

). All these are only using of_device_id from
the set of structures defined by this include (see

	{ git grep -l clk\\.h drivers/clk/samsung/; echo drivers/clk/samsung/clk.h=
; } | xargs grep -oh -E "\<(acpi_device_id|amba_id|ap_device_id|apr_device_=
id|auxiliary_device_id|bcma_device_id|ccw_device_id|cdx_device_id|coreboot_=
device_id|css_device_id|dfl_device_id|dmi_(device|system)_id|eisa_device_id=
|fsl_mc_device_id|hda_device_id|hid_device_id|hv_vmbus_device_id|i2c_device=
_id|i3c_device_id|ieee1394_device_id|input_device_id|ipack_device_id|isapnp=
_device_id|ishtp_device_id|mcb_device_id|mdio_device_id|mei_cl_device_id|mh=
i_device_id|mips_cdmm_device_id|of_device_id|parisc_device_id|pci_device_id=
|pci_epf_device_id|pcmcia_device_id|platform_device_id|pnp_(card_)?device_i=
d|rio_device_id|rpmsg_device_id|sdio_device_id|sdw_device_id|serio_device_i=
d|slim_device_id|spi_device_id|spmi_device_id|ssam_device_id|ssb_device_id|=
tb_service_id|tee_client_device_id|typec_device_id|ulpi_device_id|usb_devic=
e_id|vchiq_device_id|vio_device_id|virtio_device_id|wmi_device_id|x86_(cpu|=
device)_id|zorro_device_id|cpu_feature)\>" | sort | uniq -c

).

So <linux/mod_devicetable.h> can be replaced by <linux/device-id/of.h>
to get rid of another user of the former header.

Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@bay=
libre.com>
---
Hello,

note that this patch depends on
ad428f5811bd7fb3d91fa002174de533f9da94d7. So if you want to apply it
without having that commit yet in your tree, I recommend pulling

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux device-id-r=
ework

(or v7.2-rc2) first.

Best regards
Uwe

 drivers/clk/samsung/clk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index b1192ca03db5..cc41cd4ad317 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -11,7 +11,7 @@
 #define __SAMSUNG_CLK_H
=20
 #include <linux/clk-provider.h>
-#include <linux/mod_devicetable.h>
+#include <linux/device-id/of.h>
 #include <linux/regmap.h>
 #include "clk-pll.h"
 #include "clk-cpu.h"

base-commit: ad428f5811bd7fb3d91fa002174de533f9da94d7
--=20
2.55.0.11.g153666a7d9bb

