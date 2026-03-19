Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C536838756E
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921004; cv=none; b=oi9rstLnrv+YBjjHAQo+C0X0Ofvdjdm0s9Daq0KTSF3HU53BcEjpgJLmmyOeYAS6fMeM+a83BHcRUNqqsy5Bu49ccgB3xEpaU+m6HQW2uVNfex3O6Mw2qVcQiNfFiBNTHJvtfEi+h/zcaO5VxUig1RpO37iBpokjnsq8ZpCO1L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921004; c=relaxed/simple;
	bh=0pSRlFP9JZFkvrkuzDCFcnjTv2airPDZfsRDadw3Udo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lJRe0SZAwd3bUjloug4degZfdBmU9xX5suAh6/fD+lNj8OF1tEQMpbKoddDZqznkG2wvsECakJ6nUWQilneD14NHS+Vy4vZMEQiFkZ5Snw9S0rRVurLutv4TD/v+W1lNugmY2KqBOIS9+2vJhqdLnBR75ueCSvJsyJ8tSsEtEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZDvEiZfJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LFbP/Uxa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZDvEiZfJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LFbP/Uxa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74aS51772607
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3BOAWOzvYk6fMJYOVMFQZw
	ujVI5/ZU4UPq/N1RwuEBg=; b=ZDvEiZfJPz/ZObUnFvI5nhH8/Uy/afgFNJZayl
	tK3jPs3gTnKn7SHcyhoiwEpoo8gYZTp/X+IBn3RpNnGgynDdvrLqJmOhX32lhY3g
	DtGmARFH6LT433pUoMNb9bni7MFLuYQyqKWA4eo642e0g3+tJWidZ1l2LtuGU5ss
	3NbRXkPgOq6XQrVUceSVmpa/AreXtM054TZZl+0L0pgq7uopBL5AaZ4NeXhCvkTP
	EnQ40hYUr7BOqJYRTSH4vrzyvHsnkx3wCGUwrg2khU47djIwA7TxYz/iwWAWHaEd
	kndmL/cTlL8kfvNgzX8ScxMlX/xOmw+2wy0ZNxjJl976fS+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75ua4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 11:50:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50921f7da67so58237051cf.0
        for <linux-clk@vger.kernel.org>; Thu, 19 Mar 2026 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773921002; x=1774525802; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3BOAWOzvYk6fMJYOVMFQZwujVI5/ZU4UPq/N1RwuEBg=;
        b=LFbP/UxaUuNip36h6I80NmFtr77XHLxT1/sB9ifjmt+/gkH8NCtFlE68CHr8AHFmWG
         pxXQPoaL7GFMqnnTyVSZh4h9Il5jXgP1adamp87Z18SrScnDcRWDVqcbrBteTOKzOipe
         afFS7G8OoFxCW5h2QCRPy9cteZdASVz81956WvqsiGWIX3GX/CC+LkZ2482e9mh33pgv
         pfF0htcz+/FteB8b3KIZjXWBRz/sLhlLtaJ0hP/PtdO0JthU2km9k0GxViH41VESkR/D
         cwA1nTXpQgx9LLJnELz/lZXCYZR2BLv1F3/skSjR0vjd5RKkZsn58tcimdv6exNoVhxN
         cdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921002; x=1774525802;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BOAWOzvYk6fMJYOVMFQZwujVI5/ZU4UPq/N1RwuEBg=;
        b=feUGqzFE3XCDEK7OeaZGTFEXf8GbXxt0Qz/kmzOyeYMbu2U1l1rDu6SrA/n46Spc6Y
         CJYaleReQ1l0VxWaH/kAZLJ0vCS2gktzZRRbz1FxBtbveU9FzNIYc347PnftIPXq9XRZ
         TK9WHaB1OI5/Mh1TcYJcQLP1v3u/pgyzI4vvo1ILwgnTMNDiYA8wchD1FbOsFlEJZU9U
         HNLzmVJhYEdGYJ8s7Yw2k89dIiEl4CyqnplHqdhX0/E8DlphpGaNyf7qwOe3T5OVaJH2
         ouq0IcA+qXtPcTPrOIg63QBmgXUzbUl7ZAB3QiXXAUvdQMN7jEjy3LdWqTfTTmXncKU7
         hXUw==
X-Forwarded-Encrypted: i=1; AJvYcCUVyafb4LzY1X2lHwleKBpoKAQJuOEdugo7Iip7h0KcOjhOOkClIxZJkUaGh3Dxh2gg4kiDv7YwYmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIwCO6Tx9B2O6xnnxZwZMWmc97wub/IEKx9C69Wg8JPp+gLEze
	5DDLfrAp3ojk/Lxw2hP1BUoABdQkG6ZxQ0hrEbg6M1KJZ6LZoJdfv5l8m/B4D7AhtqXGyie3w0G
	lGwhhRW/cTCKO3G+toNldsw2etfpSZRkTMsy1qv9t4FWpuga5tY8+lvhF2jC1LA0=
X-Gm-Gg: ATEYQzyxHh5j9E4y3L00H6+ImmOcIaiiRO4CF2pZIOzwJECFUDuiZMbyK2t8ktm3Atg
	9NP1wW67gvWV9vHCDKx9EOrnTfUbBkRvHlukpUBJ1Z3hhl9nQ0STGuQ7aVY3taaneC1DtJM8fCN
	44cjibIHWbqw0RM+m3PzbOM6/+hS1DF77DGrVyC8g/XPe/aGZLnMJy8R+4bWfFZnvXWSDHMGfJs
	ZVUvtKqfH3Oj3XHU/gBKTxaxMzcnk0ov2juuD2ObpJf0eaxjuCRqzrYlxouwmumlyvR8ctDoivL
	9jJPqTYtPiFXi8I1YFY4Nysf8S7vOV7jHL8xYjfsKvV+6oghw1aFOOYjNeo6ljyUhQI/WXchmFS
	gCHGRpTvja3P8sA1RYKv6ppOiY8+cTW22gvL2umuijqbK
X-Received: by 2002:a05:622a:1890:b0:509:2032:d23e with SMTP id d75a77b69052e-50b14881e43mr86418601cf.38.1773921001911;
        Thu, 19 Mar 2026 04:50:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1890:b0:509:2032:d23e with SMTP id d75a77b69052e-50b14881e43mr86418081cf.38.1773921001387;
        Thu, 19 Mar 2026 04:50:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm66384605e9.2.2026.03.19.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:50:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/3] clk: qcom: Add Eliza Disp CC
Date: Thu, 19 Mar 2026 12:49:41 +0100
Message-Id: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANXiu2kC/4XNyQ6CMBAG4FchPVvShaXx5HsYD6UdpREotNqoh
 Hd34ORB42WSf5ZvZhIhOIhkn80kQHLR+QGD3GXEtHq4AHUWMxFMVEzympruSifje2pdHI2h0Lm
 XplbiuNa61FYSvB0DnN1jc48nzK2LNx+e25vE1+4/MXHKaANFw6CARhT64GPMp7vucLXPsZAVT
 uITU78wgZgyrCwV55Wy/Au2LMsbVZHzLw4BAAA=
X-Change-ID: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=0pSRlFP9JZFkvrkuzDCFcnjTv2airPDZfsRDadw3Udo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu+Lk5Dt/XzIDCvRSYPJIUIkzVSQAO6yXbvWE/
 OEJRZXSltKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabvi5AAKCRDBN2bmhouD
 133eD/wMwdSyvj9QZEuj8mFiE4dgiUm0vTUTOpeEZNuJ+aw1PIV+mfOKLGnNu7ZKQLI4LWePR7i
 ZUqQYxirlw1o4AZWftQ+oBm2NkK+nl+q0dcpZYo9tOyTcNtAqxv68ZBRRn/yc5vXhEqTmcTyTMR
 3UwlRVV08//YP+gxaGsLKEY7lc45XKJFb8ESb3q8pLq7+2poNAd2SPUwmgi0+MtIbdnT4K+JV1R
 Zhe97k5H0DtL8EgblR/eCWacO6YvlWLhUHbJN18SCq3LGRdxnyYVo8Jkf8H3HWpx1sy7Ok95RIR
 69ZSQ3NI4VJgDmHjSRCk4xifFDLTNKOfnlfnkPK5BJR5s8Pn4g7LDCDAHvxVWpCbt+UIpnFoDKu
 +HmxEJOFoewcTrkLSWLIgwyzLP00AAhCbJL5/HprYzwRM1izUe3PuC3jFaMhmNQMzz9M9ZFTvHg
 cv57L5hRh3/qrnl5TdPO7k4wKEcQZ6FdtdZrslKD49wEmK0cfMBd57Qa+xe4nZHr+Gce7xrIqZr
 5xbQnKO6E6zGyQkzgzekzwRIeCHXK0L9NKMim0Xi1gtU3beqkbd39OxPdNmgidwqlWOcjAjFDpT
 ddtSkgoXq7RaT864HUVv05uboy8kV+aC0mWueIhfrPV5pXbWFqiVn3lqJho4Hadsyjmg4x/i2HV
 WhygRbrWDiy+rpQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NSBTYWx0ZWRfX3twOWxXjmCAY
 RwYtbAIgjjz+Uc0oE71ug21gKmDDofwJSf4MZR5zzK9bhHtcLm/h6NE1ZzoRUeKtLvMWzrHudfB
 aHvKCIUJWEQnoCxAZOCTvEHTYUgoGorbqF5L9/IRSafqci4gPL3HvUiThli3hLxRyhaU7FO6n+H
 6e4t9g/FyOFkoZh6XzNIveGpQPz0NJq5DdYAM7Eto0pQuPx03RD0BPuViMqO/ibK4wVtfMYlY6u
 YONEmYI7ZSS698JucTVdoaVdU1Y0mmiCtSRbNjqGmOjdFDqi8HbQHSLcoGgWaP7M6UYiDlriGpB
 8A5tWpqRnSWVc5mn6DlMllx2VAMT2uhiN7RHARgnGYihZGxckWlLGREXzGBtn54LzeSA6uBrC+d
 XaAVKEpoED56DjN8oNEjiizhx6Do214tvEHeh0CmqEd1nJdf/pdkT2DZ2Le4/6MLw2n6ChZBYZq
 NsyEy+uKIV9a7MfScAQ==
X-Proofpoint-ORIG-GUID: 0q62UJBwKqqihCUi35ORBx3FQzVjSxS7
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bbe2eb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=sWils1Yjnwq4WXAT-ZUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 0q62UJBwKqqihCUi35ORBx3FQzVjSxS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190095

Changes in v3:
- Patch #1: Use maxItems
- Patch #2: Follow legal requirements, add missing disp_cc_pll0_config
  usage (W=1 build and actually test), regmap_set_bits.
- Add tags.
- Link to v2: https://patch.msgid.link/20260318-clk-qcom-dispcc-eliza-v2-0-8c05581168d1@oss.qualcomm.com

Changes in v2:
- Patch #1: Drop redundant descriptions from bindings domains - use items
- Patch #2: Use new qcom_cc_probe() syntax simplifying the probe.
            Few style nits.
- Patch #3: New defconfig patch
- Link to v1: https://patch.msgid.link/20260317-clk-qcom-dispcc-eliza-v1-0-be4b0e4eb24a@oss.qualcomm.com

Add driver for Eliza SoC display clock controller.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      dt-bindings: clock: qcom,eliza-dispcc: Add Eliza SoC display CC
      clk: qcom: dispcc-eliza: Add Eliza display clock controller support
      arm64: defconfig: Enable Qualcomm Eliza SoC display clock controller

 .../bindings/clock/qcom,eliza-dispcc.yaml          |   96 +
 arch/arm64/configs/defconfig                       |    1 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-eliza.c                    | 2121 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      |  118 ++
 6 files changed, 2346 insertions(+)
---
base-commit: 91154e9cd8b56f1c2ee4d57b03b3adb3ae865d15
change-id: 20260317-clk-qcom-dispcc-eliza-d32607aa5ad3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

