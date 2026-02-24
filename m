Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6DD369979
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771929830; cv=none; b=n/4KdoRyqs6J+dEIriYViOl6FEyLNB94daF11Sy6RovEWX1rYdx/oDLoPDJPewTtaqUXJClQHZBz3jUQvY0z70Iqtb4NVpr13KLFb+S8WqWvBIpLvSwZAkgQegoOw/e9lYazqrQIfVzVVaXRWl6uVqUwlxOACUuxkByIlHaYEMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771929830; c=relaxed/simple;
	bh=6sPDie8uUqGDS1bsA07NmZp55tMOfOGlzrz/b5hPRYY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Nge2fMRD9zXS3C0He2tdQbSaT15vZhxnT5tmp+TXZQHktdg1R95+O/aFwAb8OXvyF5S85D+Vxm/LEHSYsizdJSn5SSUcyLdU07uy+xQkKOKTUQHGcfeP9nW0K9AejIbrJtZEYNC9wSalEkAVb6p3M385tvdLRdtLA3gHZBqNd/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/oQ9vYR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dwy+DFrO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/oQ9vYR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dwy+DFrO"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFZlN2774684
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GVPafuMTkBBvdHOwmIqwEb
	y5N6HPu4j2/4G4NoYv4Ds=; b=d/oQ9vYRMDkrfNc68cBbbYSDw1IQ6cPp24mLeX
	KblHfoB6mwkPmGQ9sxCl77WDjAgfiefYV6LRzDjAaReBxt86oZ+m6nrDXY2GQXB+
	x/5XVbvu+CraARis4OvfkbU36yhSg6XK4uUu466ijZgFkJDyYvsQX4lUMhsUnb8L
	UD//CcI5M4fLbpS+/fSXfR/ZmSiRO+DCj81KyI3oTbTBJ9gvGoQQ5Q04eO3XJmj2
	InicdozEvmXzHIpVklzrHyvQNl3BRDr9CRXBXXiRwZKsS4jeeC577MgDmiYV7wXB
	tvbLh2g5ZMB3PhT6U6a1IBwB3SnJoL2ghBFJksWgjZws+aXQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgr69kcp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 10:43:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70fadd9a3so3229554785a.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 02:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771929827; x=1772534627; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GVPafuMTkBBvdHOwmIqwEby5N6HPu4j2/4G4NoYv4Ds=;
        b=Dwy+DFrOehG8atDEOSN4T2JeyU61aVQ79ex9Z06Gu07PogWqUAvfDyIl5pnsq8rBwU
         dPRqql2+Yc2DNJuZFODF6aBtrfFePCaaNLG4qUQ+UCetuTVJNY14fPddu77bUsZSXVpk
         ODBCq9VQIasCJgj7dzFZ7el7eTM2T3JpjCdNsrGjEzY3f2PzlVqQDL6/QfJC1ghIvSk0
         2rb4SHjsyB5AOHL9mdHgopZf9lO3KlBDqa0JXT7s0rrSLqtIT0306drpl/S/FQKDd0/I
         5COwGAeTG4+vMTJA0PuSgRnfi0T4Ksm6QiofYeVDeXR28FOBoZDwjaSQ3J00931rJ3fN
         4r7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771929827; x=1772534627;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVPafuMTkBBvdHOwmIqwEby5N6HPu4j2/4G4NoYv4Ds=;
        b=xPfJ6JI4AF69kxXI//shTrIJOBgexAv7snpT4aFN0uvejpbHu8uhRJzJvf3p7N5Dfb
         ypxtbqwUitB6XPizRWl5rSESwBu/2qRqqQSxOmXy0Kog01xeVJe5EuSpLWlt7Hx5Edeh
         br0rm2+iDEOHk+iPnIBUZpUqPD9vUHjg/leD6xYNPkPTPUFkiNCT/i9cr8ABOm/S4QH6
         Ug+IBzTzN5htXjEs/b9b/7M5rGsG2dBMQwvverTlnQaOMXFLgFQjBPzd61MVxCf3vlyh
         e0V7kRZ84minzoDWHBGJRM2CUEkj2rOBL5unFHqtUcWcKXFMMW3u5dXkQIbMJfOtI6Zg
         refQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR8qWoua1QWFIWA1m3UVbBm0vE7oL451p7L72/zHutqvs7AMyU9aR4nrs2mLrI11jeLaYIKYh1r84=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIZtdC8exqaovS7vS9gZDO9raTE043WlckkwzgX13Nr/jZIz5z
	B93DBVKbpYyfT+Ao98L16xNc0qyrubVSOUIu0QD29Hn6z/UyKmyAvYr4c6efrWzPhSmEaur+RFc
	2GBJuFcEZl8pK5dyTuiuCKlJdmNzbg2dOk+grodyCgfms60kljEuBa8iBJ00mUX8=
X-Gm-Gg: AZuq6aIVkh/KpHB0Cb4uQ0Wtle2fxcESzYrsQNF8RiV+AQ2nThsUqH7QnAOMmh/5RKx
	PZMhoS0n3NAf+1Id4BKp3CACvcDIOdHRBgWNkDzMl5o8RiEhtRKjtqbovW29qB+mfSypCCl5ttz
	Rj3o3EuVN+21XRtisFkktgOcuBFYNpcsDJU8BibOiXFBqvp1kMYJNRy+g/SCHlN6Jnywr10iS6q
	f1UnV0zbVGwJl9zFUQPJy6+C/0TOX63aqKZx70Zkr7zrgx1HjHG1+1sLrxg8D5whUwytVIG0RyV
	VwEUUL+NVhnzJYtF7ekM+j45Mg7KS/BPYZi8oOVqSJoCPYgoAn9CaW9GAqkbbw44LK4rF+yOS2j
	J0941QBoRNOJ4d3aLiFpEuVRbdcC69d+GdpoGqvE2nkSQBQ==
X-Received: by 2002:a05:620a:4627:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cb8ca6e217mr1443428785a.52.1771929826679;
        Tue, 24 Feb 2026 02:43:46 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8c6:ffe3:49e4 with SMTP id af79cd13be357-8cb8ca6e217mr1443426885a.52.1771929826083;
        Tue, 24 Feb 2026 02:43:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d40004sm25685906f8f.21.2026.02.24.02.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 02:43:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
Date: Tue, 24 Feb 2026 11:43:38 +0100
Message-Id: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANqAnWkC/x2MQQqAIBAAvxJ7bsE2FOwr0cFyq4XQ0Igg/HvSc
 QZmXsichDMMzQuJb8kSQ4WubWDZXdgYxVcGUmQUUY9V+oMxxAuXGPKF1hmetSarrYKanYlXef7
 lOJXyAf+h7WViAAAA
X-Change-ID: 20260223-handle-not-const-9a6eb5529590
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2696;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=6sPDie8uUqGDS1bsA07NmZp55tMOfOGlzrz/b5hPRYY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnYDcRw8HWd8txJCgD3Arumeb3Kt0gJSl22Bwu
 5P16m8ME0mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZ2A3AAKCRDBN2bmhouD
 13RsD/0U2Kzo2qesvlrOb07YD9SW5ZCP1FxlSzAGO4KbDOGkmm5by6HPnMA2oR+qWkAfHJLNNP4
 fOvAtijr6UM7Ckd6ysYb0jQLJ9GcJzeFPY44yghOURRRRQK2i5wa7p64qcCyCp1P32kHsbj7J23
 JzXFCovKdNGyFm41w2LPX4DmdaxDO4z6tRr1QfhCaKxruQefjBuORlAMA0BOVVcA2HSxfvcvJUG
 LUsf/aiM1p7Vb7tniN3bQmUZlhF7lSDwIMfMeR5EMGhHf21vgEOYjJtQRG7ZCtm6uNMdfzR0NXO
 8nJXjDY3rhLTThDp8eig8CybDwLP0kFCNNZi3m4Ro1znCVVbOi97ZsCYhyL2t3/SYXzMioXWyHW
 X9ZdZiO73mFpyEbQveSIcUJSozDn1t2p93rirFPmZkU2rmpk24qotVBI+uTprSRal74HajfsYzr
 fm44jNBruZ3VeX0xToabjB0aOc2S1udXdwlvuP2cCA6mOYdj/25TUWPIqCPWiNCt0U4ONm+eOhs
 cZ4Ysui0ZnEhX8AupCpEl3ji3sTsVGbGVBnImrxiA3jzY6pP+XT31QKcnRrM+YDG4z0Hv1SKMzy
 SmZc5CDHJozCT12HnwAIGab+HOJg8NASzJ/UIaV8Pg7YJ9G6w5imQg22Boz+n3CrFtliY8vg70j
 u6MGUlqTSqnFg0w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O6A0fR9W c=1 sm=1 tr=0 ts=699d80e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=QjCKVQx7SMNC4EIcHegA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2zBYH5-zOqZLvql_LQtcaGQH-mL5N0oj
X-Proofpoint-GUID: 2zBYH5-zOqZLvql_LQtcaGQH-mL5N0oj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA4NyBTYWx0ZWRfX0MUH7witEcBq
 2De2PAhz28gsvaBj2t65U/TeM4PgELw/zm7Mw5m/VFHFaA8O41as/BzTB8zHTCkgk3UbfW6GV/0
 3HSBelPN7IQA5K0YgAHFAjmlHNDCqD38Wd5UeWCOnWTQvjfvmb2c8thJnlECUDORu0GefkrOMwp
 KsBa6nu40PHxw7nHSfwCVlgsH3WLjkHnYW+1GxJ8QnyNC3K5zYFWWprMY9C+HJsw7IO+QQ95QyU
 j/2YSLHxL05Ar3Qu7Gs/S81m4t6RXpu4j8Wx6ULqSlPWzoyEkmjUi9Hp9qkeuaJvwpIN2DeTytd
 cm8S0oGteZM9602O2VFomNEIy45ZJcO3nZy1swiSXjD/jhNFjhIjUtmnS8rIs2Cc/uez/Y98eGo
 Ss1wCEpE7ste1WppIEAyFwhjp7ej8XOlVSqYbOlP4uFnIAr2LaJgdCMxEPkr7xf20wt9oaccEO0
 kcXyUhxHq/I/zNo197w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_01,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240087

Severale functions operating on the 'handle' pointer, like
scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
to const thus they should not modify the handle.  In fact that's a false
statement, because first thing these functions do is drop the cast to
const with container_of:

  struct scmi_info *info = handle_to_scmi_info(handle);

And with such cast the handle is easily writable with simple:

  info->handle.dev = NULL;

If the function really was not modifying the pointed handle, it would
use the container_of_const() call.

The code is not correct logically, either, because functions like
scmi_notification_instance_data_set() are meant to modify the data
behind the handle (in containing struct).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      firmware: arm_scmi: Drop fake 'const' on scmi_handle
      firmware: arm_scmi: Drop fake 'const' on scmi_protocol_handle
      firmware: arm_scmi: Use container_of_const() on scmi_handle
      firmware: arm_scmi: Use container_of_const() on scmi_protocol_instance

 drivers/clk/clk-scmi.c                             |  2 +-
 drivers/firmware/arm_scmi/base.c                   |  2 +-
 drivers/firmware/arm_scmi/clock.c                  |  2 +-
 drivers/firmware/arm_scmi/common.h                 | 15 +++---
 drivers/firmware/arm_scmi/driver.c                 | 58 +++++++++++-----------
 drivers/firmware/arm_scmi/notify.c                 |  2 +-
 drivers/firmware/arm_scmi/perf.c                   |  2 +-
 drivers/firmware/arm_scmi/pinctrl.c                |  4 +-
 drivers/firmware/arm_scmi/power.c                  |  2 +-
 drivers/firmware/arm_scmi/powercap.c               |  2 +-
 drivers/firmware/arm_scmi/protocols.h              |  4 +-
 drivers/firmware/arm_scmi/raw_mode.c               |  4 +-
 drivers/firmware/arm_scmi/raw_mode.h               |  2 +-
 drivers/firmware/arm_scmi/reset.c                  |  2 +-
 drivers/firmware/arm_scmi/sensors.c                |  2 +-
 drivers/firmware/arm_scmi/system.c                 |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-bbm.c |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-cpu.c |  2 +-
 drivers/firmware/arm_scmi/vendors/imx/imx-sm-lmm.c |  2 +-
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    |  2 +-
 drivers/firmware/arm_scmi/voltage.c                |  2 +-
 include/linux/scmi_protocol.h                      |  2 +-
 22 files changed, 60 insertions(+), 59 deletions(-)
---
base-commit: 5848db9e2caaa560a21ce692c4c32badef3c813f
change-id: 20260223-handle-not-const-9a6eb5529590

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

