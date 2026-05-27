Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B150F280318
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875302; cv=none; b=Q1RHa6YlW4m3zvsDghXuCDFeHU+bk1pzsX8/FkSf2fKqeE9oQvzr1h/gcvpOT2t+w0XCxxKHNwIXq57ZF724p7EGNXbSaScRqV+5tCiU+K3qhw/TwcJw5Opo7qU4y0aL5JLz2ytrXbL2F4QZ4GuCnbu5T1n0Hhyzv1QCpNYmcYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875302; c=relaxed/simple;
	bh=vY5alGQnvN2SUxCbv/52PVm8z2NAgcaGBRNga8obKmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqrI82uBYP+NyHUGXt9C+k507m8gTyKShPqLVMRafBzHLkKpZ/ZnSMyyS1+AbJs9XiEQLAMw2GZ38t0braQRXfacNmG2FMKUq0eFCM3g69BA6imOgWKecYSM9hu2jlWqN5Td/4TfuQKGHnaEJqSBm78Wp5OaAG0gQp2+eOqJhfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c+bo5xbI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jV+hfg46; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c+bo5xbI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jV+hfg46"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8n7XH1178516
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1k37Lr5RJOy
	L0KwHRKq9W1TZ1KX8xpCbT9JxNvgGj4M=; b=c+bo5xbI3BNjUBX3bGZg4N+dWiy
	JykEeI1dy+CisQHHMLH/h59AuAz5zA8vm2O8zBZmhb9c4AKScab/+xcDUIoywljo
	On7wSCmpH3cK2RpCm4Qey0l4hFmTXPdb3MnQCJIsNoj/gXjL18dz2n7s8aecsCEU
	oCwHhbVgoiEcuj/KsyNxLR5o20bNTW9K6+65np8zx8MVEjdaA4jD8ykzP+XyerMa
	oJuVh7rnOOIQ63N2s0y0DqwvZqeEpcXLi3k8bFB1Q94t6JMZmpMbI98+pBJLb6Q3
	+EuPqVkwbRv0PH+HoIRKfxkZbQ+eRY73cKYrJpyndd11gMxw4tCywidu+fA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edndnhx5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 09:48:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516879bf1a7so288690391cf.1
        for <linux-clk@vger.kernel.org>; Wed, 27 May 2026 02:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875299; x=1780480099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1k37Lr5RJOyL0KwHRKq9W1TZ1KX8xpCbT9JxNvgGj4M=;
        b=jV+hfg46eRVzWqWU9QxVJuMOdEnj18dfmEKGEg9ADUpjn5KeB01EWCs6BqdLtBEgw/
         dWV49zRBozxWosVZqe+CLkHKW7zSkslge3T3BQ5zQNyuTBrrwafMYbEb2bLyRrLTd9E8
         axUaj5+OSIkujiGXr5hFKOM7LuKhY5T7d13mZoEkkdSHqQM3mTfBbDFe1yWaf4LxIvSb
         UklDDih/cL/lwzOk2c3aSedgPvPVIfyxS/Yo55oHEqxKivxYnAB7rgIMFg5uqCOBJZSF
         vdIbhsAShHFoR6t7OAcD7Xmx8QE7q037zaqm9j90Qsv4WJ1mriieS1NRdjxgCjMlXAA2
         RM1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875299; x=1780480099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1k37Lr5RJOyL0KwHRKq9W1TZ1KX8xpCbT9JxNvgGj4M=;
        b=RW6FWU8WVFqDuCdlL9W/GCq6u5dftXDcjn4O2BTAl3cbHnOL6uyK8g4nqow7it5NMg
         QW3jtDs4r0w1J4iCBfN8E02eL5j6HU4U9bBGI0pqL8oY9uGO4TFL4uUNjgS9zJYJwtIV
         XY8HfV5yEyyff1fJRHg9FTRpl+m7uZvuSFX9qorGzv59KpzOXrqNSv9p29kMLoV8PVAE
         iecWGz18WSVu/HlWFzt1G21mll3x4KtzZ5A8Cpt4YurgiqF6cVMyeN4nwAcG9stoNk3G
         G1/pCPED+Z7aj+yRmsnodes9d04b5jln1AQsxZIZGXFuIhk8XVmpzWvRExIzxHXkqr2L
         Q7Yw==
X-Forwarded-Encrypted: i=1; AFNElJ8qEAYPkd2z9xq792pP/Yq3XoaefXh9bYBN4dyJ5/EEMh2g6Ybs7ywJvDax9Y8mgBjFjyQhuU9QgcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyrC64vus9ys1P27tw0ooAaOW+gg4zc+MgmG7lQIIjEhfYaO70
	0yny9d6e7nUfoVrWAfukqJ9LVxBG12KyYLSYF8KjmKJpCC1E5dURj98IlSaJ6tFdkbFCFZVmcPy
	uaF5uuNby+h/j1fSOoO0l863ZybPVo4XgPsb1+cxmRHIyD+/ZT04/ubPfAWyb6N8=
X-Gm-Gg: Acq92OHb+Dxa4fqcgPHP4v+v1l6+ZGLzjBZRzwNh/xwsSRwk8zRh+YtTZbXYw6gaUiU
	Gb68KmEY8qpnrm83Gd7d5Zkng8saEiogQWGIeXjp50wOgl5m2QyCLmvJbKaBZ5L+NKeaAMrllfl
	y+96s0NtuahCcdiJ1i6RJ4RNXJSoQPFkrZ1O3okHwldschqDbV0NpLWSlEHrtPmUefzd48shCWs
	M1NOCVm4AZrVNp6/5AeCzXf8VhwNM0KfadByK/iw0dUB9CIXNq71Kw2Q6VO4sHbefAmpSnrO80w
	teOC4h98DVT85N9xkdy7lQia0kM5MhYxeZ/FKm/floPlLD0knCyitD3Iq5aT4Mlpndc7zY51nkp
	B8RZjHssZTSuuOSodt6BgbUC7q/cbgpULJjjWcy23Ugqzfe0+LVpg73P47vQsY4PbZ7ZEjlqctD
	5SnWwJcx9ZDr4JTQp+hCtBQhDLKkD89+ZFJ4lDr3+HcaREV2c=
X-Received: by 2002:a05:622a:8c3:b0:516:e6e6:63cd with SMTP id d75a77b69052e-516e6e66935mr173375971cf.2.1779875298920;
        Wed, 27 May 2026 02:48:18 -0700 (PDT)
X-Received: by 2002:a05:622a:8c3:b0:516:e6e6:63cd with SMTP id d75a77b69052e-516e6e66935mr173375871cf.2.1779875298537;
        Wed, 27 May 2026 02:48:18 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6fb31611sm544001a12.22.2026.05.27.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:48:17 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Helge Deller <deller@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 2/3] drm/sysfb: simpledrm: Use __clk_disable_unprepare_counts_only()
Date: Wed, 27 May 2026 11:48:10 +0200
Message-ID: <20260527094811.116977-3-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PpSjqQM3 c=1 sm=1 tr=0 ts=6a16bde3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=3MuA7b1g13mpG401syMA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ngOb1N-uAq3jQz_UdGucCvk_M7-0gkj6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NCBTYWx0ZWRfX52CRCp1vMWkn
 u99FFf/kxikcPC1iWic0bXwqTvstqs4JG8Mv2CPetzqdXhmQeOJ1e+I6gr1y+lSvpevGCkk+NcS
 poUQbAEOeKqU2vTkgSqBukOkJU3+k3aVX6OcAScDLhTR+RZSa+seh1jZnb0hYAustqnd88aSNZK
 oQzp8ZGECVegVDr0pyrt5YLC99y2IzVNrEBE/Wozww8rdELbaSl10oFnUuy8AMvGivhN6ACu3jG
 irUeyZlR8zXSS2nCykpWMGhFKBeeJySVHjKJP+1qq0thJPgHGDPO96xSOuhCVKM0dLkizdydsZN
 qxh+j0fpjcC0nAe3HMY6RxIL6+LJhw8lU97/WTnppUtmdfMuxlTko+BR3QMIOnZyNl3miOWZFrb
 KcZMeq85dmuvhyWYEXl08InTO90ZQEbKDjzxI9mrM2ojme/qADI1CTPi5d8IhWUXCbnFflAYPyA
 gHf0ysR5SkjtWsWGt2A==
X-Proofpoint-GUID: ngOb1N-uAq3jQz_UdGucCvk_M7-0gkj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270094

simpledrm_device_init_clocks() calls clk_prepare_enable() to avoid clocks
used by the framebuffer getting turned off while in use.

simpledrm_device_release_clocks() then must call clk_disable_unprepare()
to balance the enable count. clk_disable_unprepare() actually turns the
clock off, messing with the hardware state before the real display driver
loads, without any knowledge of the proper display power-off sequence.

Sometimes this leaves the hardware in an undefined state e.g. on some
Qualcomm platforms turning off the DP clocks at simpledrm remove() results
in the following error when the msm display driver tries to re-enable them:

[    2.980181] disp_cc_mdss_dptx3_pixel0_clk_src: rcg didn't update its configuration.
[    2.980272] WARNING: drivers/clk/qcom/clk-rcg2.c:136 at update_config+0xdc/0x100

Switch to using the new __clk_disable_unprepare_counts_only() function,
which decrements the counts without actually turning off the clocks.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/gpu/drm/sysfb/simpledrm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/sysfb/simpledrm.c b/drivers/gpu/drm/sysfb/simpledrm.c
index 7a95d2dacd9d..6927a32ed282 100644
--- a/drivers/gpu/drm/sysfb/simpledrm.c
+++ b/drivers/gpu/drm/sysfb/simpledrm.c
@@ -261,7 +261,7 @@ static void simpledrm_device_release_clocks(void *res)
 
 	for (i = 0; i < sdev->clk_count; ++i) {
 		if (sdev->clks[i]) {
-			clk_disable_unprepare(sdev->clks[i]);
+			__clk_disable_unprepare_counts_only(sdev->clks[i]);
 			clk_put(sdev->clks[i]);
 		}
 	}
@@ -315,7 +315,7 @@ static int simpledrm_device_init_clocks(struct simpledrm_device *sdev)
 	while (i) {
 		--i;
 		if (sdev->clks[i]) {
-			clk_disable_unprepare(sdev->clks[i]);
+			__clk_disable_unprepare_counts_only(sdev->clks[i]);
 			clk_put(sdev->clks[i]);
 		}
 	}
-- 
2.54.0

