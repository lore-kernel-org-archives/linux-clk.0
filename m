Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B76360EC4
	for <linux-clk@vger.kernel.org>; Tue,  8 Sep 2026 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889674; cv=none; b=n1KOXNYXx7EHQQOmUBeNrFw5HuRn0emobiLRVa8giSTyQPs4n+YClAhWHHexrMewylcwWVQWdaEU8Whme7IUiQ/98jCn56JoyMeEdGfUmgbk1Yxdx41GEhO5dPT/Am7L/s1cwHegZSRITJXIHw/gfUaQ4R6CHb0lxl/o8qZbpxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889674; c=relaxed/simple;
	bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gW1K6jODF0n3zej0eqDMJZibLOJZLDZtShcaRAE7H2qTmEdCCuTKDAG+IMHyjBZoIS+K5Yp/I5XdCVWwnG81+FYwAunurgyFLuCBqOPMG/F9Qb7McDaCyeMBVf25elfbElCIXVBtth4SUVlK99865e9kHVQ04mWABhcdmzMCrxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VaY9IMUT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pZuibKzm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VaY9IMUT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pZuibKzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
	b=VaY9IMUTle+pyOxoxXNr0Tbg5UURNHwNcFoeJPPdV0d5sJm7Fx7Amqa/nXxCcpm1gMSq28
	K6dsCxiADLHeg7E8qBqM1OQ6B+4UlQ8ZwCf5tQdapypnTI1Botvb5jzmdjrwuMCL6OCbtD
	Wtyss9NISVOQpuBPzYYE5rkptEaZ6q4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-dYYLeTj0MNOEBV5BZjdTWg-1; Tue, 08 Sep 2026 13:47:49 -0400
X-MC-Unique: dYYLeTj0MNOEBV5BZjdTWg-1
X-Mimecast-MFC-AGG-ID: dYYLeTj0MNOEBV5BZjdTWg_1788889669
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-933023a5980so394572185a.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Sep 2026 10:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788889669; x=1789494469; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
        b=pZuibKzmFZZ939reGEtb0YNv/CCww6fbtG1C4DCNeXByKikXlTbzhVjv6mSs2b/NeY
         ddbS1WzmDcYZ/aj59mBPkpujNIzDeug0T8h0pe18sxW16ezjdp9qzdoy6Ags/Qo+qfGR
         dT5QlyU3rH4D1x/HawewZF5yxNXet+LxrElipjV2U0m2oHZhxh60KfJw1eV5RgVstiHR
         8fOMfbFk5WnLx6QHcXGZLfXs40zWOhEWqR993ANfSWErm4zNrdByaIEreBa3eGNBo3Bn
         vTMKMvBwTKiHeuI8ziTgnnj+j5LyIIYlMaZFskP2CWgDEoC4hBueZjHLKCU9HtanFS9B
         RmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889669; x=1789494469;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L/9EDTVW1f5os/f7T4ZyE6gcGjRjE8APgfGQstVr0ZE=;
        b=Qoyek3rcMy9s2yapSXQO1zjhHLIzsl/VrYDxSbPEJp6NHLfPQaWTjrD+1qyK9sf6AA
         6y7X2KAsP9qHIRPKNGSmc1ID/aW/ht809YJBI1cCDX3nfq+ZW+Lmp2pmp56w+cD8/DDo
         VVr0/4sPJR5Y174oKcjOn/nvLO2uFkkujvHohKoiOtpHDrET5v3w4jYmgJrqtC3t97Z5
         bAldkZGl5JcxsBXugfo5KRHANgos+GfpNDUyxOugy4rQxeUR5ODzpvYbk2btCHj+PHo6
         Zf6mavPpcnrAv4vvELy2RJtYQP/kaiqBB1iAzdVaBFAn3xruxDvHBEzZ9A9O5H9fKgnE
         glkw==
X-Forwarded-Encrypted: i=1; AKwUvBztj+/bvJRwnD55XijLao/jhYLgU/NesISx1XWQ1lJOD3CJ/rVJCCNevPPyxUGvcFmieX1Ke7Ke6p4=@vger.kernel.org
X-Gm-Message-State: AFuF++kW/gvgVtwToQV6CwDbFpWjYsglwTAfq7UawU4GmGBNLZ4oywVG
	C7rgzCj5P0WB1aeB/CAwb8jo6UaFS0ShlIVzd7xJbd1nDTasuJAqACVw0BvpI2XR2MrLC4P26Uu
	OOHgPBHJnFC6P6jShRiRVR8Pc3ZKtW9HZSa6i/nLKYBZ9vptdoR0aajD7sa96ow==
X-Gm-Gg: AYBFou08mYFeCT9/zLxQTwS3SzfKsGjr2Bbn4CFJjfOzBGyxoWj2ijOxoglWZjcQwmJ
	4O4LBgBhO7skLcOjHhpNO6I7Yv+Y8Tf1sXz88SpqpaTqNOwjnI/BUH24tTCWcqU3pHVjxi786FF
	al5bzY3VhIkGgdwXGV40WrPD0xusR6kErBT5KP+wi4QF5k+PweT7BpoxyDPWgtBPrWUQRhjQ1ow
	8DqUKl6TL8H4yRbN0sdFpqpo9qZMP7n7tvxoULTKld0Y016Ld7q6uZTehMK9vWb1JEfNREnKNm0
	pOGMxBfltCIVzFQv6eiMIQb4o+R4N0ONHl99ZXtWtxtXLuDJ9J1jwCcP2QTKilHX3aOeIlff8iM
	WjjAMAWTTsY6OLll4AgVaWrlgun9lfuEMUF2zUaA=
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317461385a.32.1788889665994;
        Tue, 08 Sep 2026 10:47:45 -0700 (PDT)
X-Received: by 2002:a05:620a:227:b0:939:e76:cba5 with SMTP id af79cd13be357-93980426544mr2317454985a.32.1788889665304;
        Tue, 08 Sep 2026 10:47:45 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:44 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce
 boilerplate code in drivers
Date: Tue, 08 Sep 2026 13:47:17 -0400
Message-Id: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwML3eLSpOLK4vjMvMyS5MScHF0D05S0FNO0JIM0AxMloK6CotS0zAq
 widGxED5QS1ZqcgnIGKXaWgApYv2WcwAAAA==
X-Change-ID: 20260908-subsys_initcall-05dfd5fb0f04
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=YCLRa58s7uyQdIbB8Ph134sD0TUv41BQ2FR6V6uf2cM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeJmuupF5qfh/577Yn+n6AlwhRTy8z9+nMK7UN53dY
 njB8hdTRykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABP5y8DwV+bCmc9hUzsWllQ3
 T0866pnk3+b3w9Wt4l5L02+uoEu3rjAyzC//cKIqLmHOvw/rd5y/xuD2JExGfTFbQpY2n87nG8c
 fcwEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

There are a fair number of clk drivers that are registered at the
subsys_initcall level since some clk drivers need to be initialized
early for other drivers. Let's add a new macro
subsys_platform_driver() similar module_platform_driver() to eliminate
some boilerplate code in the drivers.

This series converts the Qualcomm and Renesas clk drivers to show the
code savings that can be achieved. Once this lands, I'll convert the
remaining clk drivers this development cycle if all of this can go
through the clk tree.

Outside of drivers/clk, there are 364 drivers that use subsys_initcall
and I am willing to convert those as well starting the next development
cycle once this lands in Linus's tree.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (4):
      driver: core: add subsys_driver() macro
      driver: core: platform: add subsys_platform_driver() macro
      clk: qcom: convert drivers over to use subsys_platform_driver()
      clk: renesas: convert drivers over to use subsys_platform_driver()

 drivers/clk/qcom/dispcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/gcc-eliza.c           | 12 +-----------
 drivers/clk/qcom/gcc-glymur.c          | 12 +-----------
 drivers/clk/qcom/gcc-hawi.c            | 12 +-----------
 drivers/clk/qcom/gcc-kaanapali.c       | 12 +-----------
 drivers/clk/qcom/gcc-kuno.c            | 12 +-----------
 drivers/clk/qcom/gcc-milos.c           | 12 +-----------
 drivers/clk/qcom/gcc-nord.c            | 12 +-----------
 drivers/clk/qcom/gcc-qcm2290.c         | 12 +-----------
 drivers/clk/qcom/gcc-qcs615.c          | 12 +-----------
 drivers/clk/qcom/gcc-qcs8300.c         | 12 +-----------
 drivers/clk/qcom/gcc-qdu1000.c         | 12 +-----------
 drivers/clk/qcom/gcc-sar2130p.c        | 12 +-----------
 drivers/clk/qcom/gcc-sc7280.c          | 12 +-----------
 drivers/clk/qcom/gcc-sc8280xp.c        | 12 +-----------
 drivers/clk/qcom/gcc-sdx55.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx65.c           | 12 +-----------
 drivers/clk/qcom/gcc-sdx75.c           | 12 +-----------
 drivers/clk/qcom/gcc-shikra.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm4450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6115.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6125.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm6375.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm7150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8150.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8250.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8350.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8450.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8550.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8650.c          | 12 +-----------
 drivers/clk/qcom/gcc-sm8750.c          | 12 +-----------
 drivers/clk/qcom/gcc-x1e80100.c        | 12 +-----------
 drivers/clk/qcom/lpasscc-sc7280.c      | 12 +-----------
 drivers/clk/qcom/lpasscc-sdm845.c      | 12 +-----------
 drivers/clk/qcom/tcsrcc-eliza.c        | 12 +-----------
 drivers/clk/qcom/tcsrcc-glymur.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-kaanapali.c    | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8550.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8650.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-sm8750.c       | 12 +-----------
 drivers/clk/qcom/tcsrcc-x1e80100.c     | 12 +-----------
 drivers/clk/qcom/videocc-sm8750.c      | 12 +-----------
 drivers/clk/renesas/r9a06g032-clocks.c |  8 +-------
 drivers/clk/renesas/renesas-cpg-mssr.c |  7 +------
 drivers/clk/renesas/rzg2l-cpg.c        |  7 +------
 drivers/clk/renesas/rzv2h-cpg.c        |  7 +------
 include/linux/device/driver.h          | 31 +++++++++++++++++++++++++++++++
 include/linux/platform_device.h        | 30 ++++++++++++++++++++++++++++++
 48 files changed, 107 insertions(+), 487 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260908-subsys_initcall-05dfd5fb0f04

Best regards,
--  
Brian Masney <bmasney@redhat.com>

