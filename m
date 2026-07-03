Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5037E316
	for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2026 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783073059; cv=none; b=lWMpFZrUaWfyuMBkx2UXVi9kGgM2LOZ5elJfzlPNrIC+jLRKO9pAlSPSaS4W78k9xpujP+BMDK5ODGOBl2rO+RAcrPZwfXxQH5+0a60wUL6Nc6SwRAgcJSk4ADgPuCh39ta4Afkw+g4b4Erar1YCS1NrVcrsIb8fzezA3MqO7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783073059; c=relaxed/simple;
	bh=Ge9oc4vb+i32Zwii1RdJnAu1twKM4C3P0N5lboaUfjU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XJunH2A/P2U2xXYm0806AfzNPY/dBFqjC9eZLAd9/Ueq6/d95VnbTFGjaV63YGCNz2DtTRekrIKCeCpfk2Pucw+OMuW2ySu77CLuGxA5h1emM47lKXf0Q+GcGP4+yKPHVmeTgmm0e9UkwcmFJvmxo35ZG7cnhkZ3GNJv3k3W6ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFT0SbzE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy2/Md4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFT0SbzE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uy2/Md4T"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rivC3134735
	for <linux-clk@vger.kernel.org>; Fri, 3 Jul 2026 10:04:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jH9XKM65dlZOUTQA8la8fi
	9KMsEB9L8o8GY8c7eRgV0=; b=hFT0SbzEv3vH0TT4wB1je6oeNEF6ncBNwNkH1s
	/s0fdXatwjyf+tX/OaARnsK/0yDeFzKsp7nFN1DS+ZJHa1PcXcCUtiaLWxuQkaSa
	TvoME2kgLiGv57N/vH4r3yiMNHX2WVCWIU8uKtMHPXWgkjqWs8wM5vu3JI75Vg2n
	wZGZCOsTTnifAgA4qPVSqW9fEyTXupDhCXG4/SgAE1HihsXpauycxtB3I4diC8H/
	fkM67tMeJ3Gio3S9qhUX1KRY2VHTLtHBUzTfRHuDFqAtgkle4ZtArjGR+TM5kS6I
	ThyaIXKdwbxqgse3nUcKr25HlO5ixYvI5oDaV2kfWA4614fg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f65qchgw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 10:04:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so30216385a.1
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2026 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783073056; x=1783677856; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jH9XKM65dlZOUTQA8la8fi9KMsEB9L8o8GY8c7eRgV0=;
        b=Uy2/Md4TwzB7ObL9CoWgcIN/bfzjpzEi5FGXrFr80C2zQ6pvxbI09Rww9Bkhw7T4Ns
         WvGUIrAfhb7MNZVMjTm6vS7Y39CdB7/0QiV29ffTsy929f8fY/pQ9796JLr3QTFxKUQf
         vzSrih0StMHTL4x+rfLgjE3k1CJICV7/sSXOQiyz0Mn+fsJ+k4vl84xJRzaClgHMu0He
         XXBke2u8ZhMyd+0cUN5E7JBtB+KBpMtoKkik9kccNRr49zhQ67q/oN/+knfBrC18d+va
         NsyV866Xu3INhAoyocsP+k9++SS4U97WfaK2Lm57CTROm9/uoCqkgSzNbSpzEhzFfAGV
         eZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783073056; x=1783677856;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH9XKM65dlZOUTQA8la8fi9KMsEB9L8o8GY8c7eRgV0=;
        b=ltbeXwnbgGpnOPyC0p23aT9OL4yvIZ8XQMq7Y20iC88Kr+/cP+2BnOn68XsI9vppFS
         FErOjq1ZVgKSyrXYX7pea9pNNjRGhbMGxLgJPB4NxWl4Vf9xsMq86AW6/K1ivMsRn4Re
         pBkbecycSU6bOEXD9mrTtTB1cXIEVDfczGenMYJWZu9A7H4tiCa4CT7/HTDaZIk2aN6E
         azjKBEvzQczuP1vv+WeNFPVIYR0bvd/lSkqK2fhGDlvi92G57EYs4CotDkO/mv5g6hCs
         dZHPdRwrFt/eeZgvjoUYIcEgAJVsFGp6PKNXeZKj3plmyGbfu/EkKnMSZGMgbmyn4R2s
         K/uA==
X-Forwarded-Encrypted: i=1; AFNElJ/hGTE3UlZASA8I3byEHjYlrQ6IvrhaeB5aZersh4pKL7PXpFOWV6c0loxdjWH0Zc04P9CS1hx0QnI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZgXNSoB6Kzr5SVFpFHNWN7MpzP5lUNvNhfyTOv9H+w5ljq7E
	yibMz7DwjC4+Nm4CJ+TCdH94sRq1wudV+ksX/BsGGLj55NOrf9LNk+uGxf4SKpTJtY24sSzzltF
	wQIkJP3RUKvOR6gy+ySe9oea0AyJ8q3GfcNlQ9+3rFqn5zUMpvvumUmwjMhiUB+o=
X-Gm-Gg: AfdE7cmj3MkTeveyoiz1/VLaji/pSkIqzP0bEIlfMpJGCRhaBcwi78yDDfCzz9yFig9
	m/mm91ET7yPl/t4hMx3s017lR+2UgBXqvnjGcqqvQWU/wpEaLTAgSnWMc8rWN/t2HeDmzgsZYed
	ZjpmRUbasCh66yMInWhJKz+PhjjF6xpzeGti1FwfIv79K6rSVcVkCgyM1MvS+syz8+lbOzBhAVc
	KcFs7vILH1dcnYFpdulF0HO+WpyCShvFJI289DvUWg9ELAZyaU0MSDvMR08uAdiLFGAoS4KSW38
	brLDCf48sbfvc8Da2iXJ7v3+CaJJuUf11gml5uFhlfgX0xs0EX61ator3rmrXkRCnIbGDW5sdx1
	L4QTCq3vxDpU0VYlqDcuWrmOiEp7XGWOpFUI=
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr1240736385a.21.1783073055078;
        Fri, 03 Jul 2026 03:04:15 -0700 (PDT)
X-Received: by 2002:a05:620a:284c:b0:92a:f65e:1e95 with SMTP id af79cd13be357-92e7825b261mr1240729285a.21.1783073054365;
        Fri, 03 Jul 2026 03:04:14 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493ccd9d607sm51353505e9.2.2026.07.03.03.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 03:04:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Fri, 03 Jul 2026 12:03:58 +0200
Message-Id: <20260703-clk-qcom-defaults-v3-0-78894525e54a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBAF0KuQri1pKxRw5T2MC5hOpQpUKBAN4
 e62uHBD3Ezykz/vL8ThYNCRU7SQAWfjjO18OB4iAnXZ3ZAa5TMRTEiWcEmhedAebEsV6nJqRkd
 zyFWRSl0xUMT/PQfU5rWZl+s3u6m6I4wBCo3auNEO72105qH3z585ZTTNCsxSSEBjerbOxf1UN
 r7Wxv6QMDOLHyRZsQcJDzGQGTCpoOR8B1rX9QPAQexWFAEAAA==
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ge9oc4vb+i32Zwii1RdJnAu1twKM4C3P0N5lboaUfjU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqR4kTqBNgJ81BCLmAPpIsG1hyn6Gfbn5viQE0f
 zKZZayrliKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakeJEwAKCRDBN2bmhouD
 15MwD/9Yj2Z1tJge6THq+IAa7UeH4D1U8Z/wDjzxdquLZk+pE173+UnEypB02kKeIfTyJStVb9E
 GllXHUxajhT5E39z3xNDID2QrH17c+J5k2loddHZzg4tnxGN8/Yjpyo5/xUuxCRWoBkP0pWz8sW
 l+djxepWEG7kR9UNgon2groHz8E1yV/k7PPdQmT+xDnGdwdrf5ZtkEqGjuYpOekEp/rXsJnG6qo
 Bwu4fft7o+up7XRHLl2TMFlF0T69UEUkksoXNOQvy50/nVA+Ink/6kuWn5LkK8HTKND3SGDJBBI
 7Ctu1o9EvbKJjmFBMosOEUJ8/ZTfzPNiTkeQziZ7vT5nuMTDQAVTQaxWWiyvt0rLT/tG1Zi4Cj/
 wwUMtdAVGoDEYBG5Yrp0JNWLNzH2UdZZ27gAAfEsw8z6aUnIccp/G/AzAdX04ZbeLatBp7m2Uh4
 4NF+TT4bgqCkwMui96zEB1G+Ig9oAShxHetbs58YeitSHm0N2CJFT5I7H0r/y4c73LZL3N0AktK
 iSIxFjO5TOOa2Ouy1Il8oA0D6/rbFwxWpNEZiPIZSyOvYkNpyhOettD67lh7oydJvpeVBbMXUtK
 nKuGqmYZa5kBKdJFVr+J5UqYpx93Nse2dPCGmd6eVDxo+jnOWKhMMLRKbUfeGP1aSh03VJn0A2G
 S0yq66gRRNJJUgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: H1H4sp_n8KkneUfM614sdWOPUWMz8r5W
X-Authority-Analysis: v=2.4 cv=Bb7oFLt2 c=1 sm=1 tr=0 ts=6a478920 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=TT7kfrB5TxoYu55ZGY8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: H1H4sp_n8KkneUfM614sdWOPUWMz8r5W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfX5ofX9cAE0MvT
 FiuR0MiAWusECkev9FTQ0NsxlYGRVtD7N9U/lHm7ZPXK6wriacbScDimrD+xunEuplqZcW3uyeW
 GZtZUUpwNAJ5mgffj72BYKWV3eAg9miBmfjDjOOMruwAcBp2Fqhu2Hzv2wR+whyh1sn8NRP/cI/
 pdFg7mPKWH1aFcLB9/o/yaDO8xtLXEU6Tp/dkUe99riAd6TUw1oSDQ9R4O9flElgidUQpe415WP
 HW2APAbQhQhXpdos7xL0y1PPWXPZ6Wn4yvk6p+FBqJG4DRma3IOvkEOT0sWH2RF+Y11yNWU8avZ
 0Ar6iNqEei1ScpoxBDLJh0T9PhCI2WnkMl11LsRCA/Mjq6X733u3kpilfRuLH0Du86/MwxhSWRi
 01PezCJB0K7Du5UsUNbZpWrJaKKOogB7fUoSlps8MKx2RqFCRqEZ0NXuctwdZL0zYIVztkMc+Wi
 Y+tTBdDTf5MoskXB/Eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NyBTYWx0ZWRfXzRa7QZntzaro
 1UF1BpGeoiFdHZU15stckPgRNG8MpO5holsL5+S/URJv9OTxdu/K3MyGp5M6fb1VVKEV32BmOMy
 6zj1pqedUDQXzsiofvMPY1svemC34sA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030097

Merging, Bjorn:
===============
All clock changes via Qualcomm clock tree. The defconfig can wait a
cycle or could be applied via the same branch on Qualcomm tree. In case
of the latter, keep it on separate branch in case this needs to be
shared with soc@ tree.

Changes in v3:
- Add tags
- Make SDM_GCC_660 builtin
- Link to v2: https://patch.msgid.link/20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com

Changes in v2:
- Significant rework:
- Add more commits, also for arm32 drivers
- Split defconfig changes to separate commits, so clock can still go
  this cycle and defconfig later. Also, less conflicts.
- Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
- Dropped most review tags, due to changes.

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      clk: qcom: Make important ARM64 drivers default
      clk: qcom: Make important ARM32 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm/configs/multi_v7_defconfig |   9 --
 arch/arm/configs/qcom_defconfig     |  14 ---
 arch/arm64/configs/defconfig        | 119 -----------------------
 drivers/clk/qcom/Kconfig            | 186 ++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 142 deletions(-)
---
base-commit: efa85f42554564c3ed7e6ef611ba21025e58c28c
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

