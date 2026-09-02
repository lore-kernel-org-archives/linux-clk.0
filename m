Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591E489863
	for <linux-clk@vger.kernel.org>; Wed,  2 Sep 2026 11:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788350336; cv=none; b=ufWE+WvYYwG7JjijEuWsBLcAjEqRkfNJXZvcAXVJxY7q8cLw5/bSGpYHtX5hhLdsilw34VoO9yIagvKPtM6HBHk+iQ/EWuccncLpEGKIKbCYod7mxpaaOQxnX25JAskwcF3VrpgICSGSkbY0v/sHwRPYkMsnE0fvnaTC7AIITaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788350336; c=relaxed/simple;
	bh=JnRa08bIcjzzxfGRPFAlp0578fFiCK2SswzFgr9x5/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NrAZAZI4A/MBxK+SIeks3FtQIN3V/+Fa5TmM3xWK4MlqeCTuXBIn38ng2B5zImpPNcS2BLPh2HJHSovKNq/r2RzSmOfHF9SHhnNLPxTIodzfUdFPUlDep6SmQ3Ey0yikhSWvWQ6N9ZsD0+yrFuL+aFD5PH+/i9jSowuEgtubbFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl/sYjzP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gJohobs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yl/sYjzP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gJohobs3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682BMCVd1505603
	for <linux-clk@vger.kernel.org>; Wed, 2 Sep 2026 11:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=iRI/+ArwwE+ptZgIHtQ+03
	bm2VmcwrmWGTw0xv8R8iw=; b=Yl/sYjzPUfwC/Pn/Erux80RVVae4RH0Sda5dqH
	7OHU9IJITRbEOmhz5rd9nghBaC89Yq3begQWoUigxm36EwVMz11IcZAZ8e8ThTkq
	Fxyaud9YHRwZ2PR9lUsqUZju82hTZybiwlfPdfhgU3rQPAprlkM7K6N7njtt/clP
	OYJxqttttrBdfAXnBqUZDqOCYgoazjqAkcdh4+1dsRCuTERXbp6iE3awZ6g+9ehD
	hq5zkndkcrgDt7WSpp12V0MdgWtqepJS88w3qPhBj1uAeqmOtnR9ErPXDqUCe3Ia
	wB+r1Ka8ALvsX86KMk6PdnmIG/J+OWNLpHaw0ATumIixSILA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv884x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 11:58:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso157568185a.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Sep 2026 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788350317; x=1788955117; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iRI/+ArwwE+ptZgIHtQ+03bm2VmcwrmWGTw0xv8R8iw=;
        b=gJohobs3IPJSqEEzeMvOFqHV4/t6eU6wogTA1O/7TomcuOgXWN3neHma+YtVD7r8cE
         iT0gHNclhUhaFudU3rPxCs/UBC7Fjmx8WiGj6H4cPxo7+aDNn6jNGXHZH6m9dUirfNDu
         nkxmZqqrjo5uhDtwHGeIQucCH1eEfY9/lTOz1T/yT1slkOk1VRfX76CchM0qGSVu58UH
         syaeJlV54+o3WK2ogtDLM3bTD+iIgM31STVb5VfEzzqAUaTdLVMDK9bwG5v1ypJ48yMa
         0J6I0kEE1qDJ123sHxg8lqWQeYDw8yS+z90uYsWZ4U+IhDzecsEgDstoxpCpwXXdh0AO
         BLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788350317; x=1788955117;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iRI/+ArwwE+ptZgIHtQ+03bm2VmcwrmWGTw0xv8R8iw=;
        b=IaHV8zFwWIwpa8Gq541j0lHT+2Wj8tY2lL1iEig/D2xt9XlYiw3U9839Ql/D0eNByt
         tIHntf5DRB2Pv4NfESpvmcogyvJckRneLNKUApVjr8fmaxdMPajp73bQcrCmePbw5xTt
         6fIud1oKUmsqHsRjvuCHmwXxlKY3PQJb0GxwTx3y2iLogRQkqzhw5eoLivARQaCVOOlF
         +oL49FtHwup7Dx9oIbCv81v631TFgD3ElNsknAl/m4224WJbye4XUBOIGprT1YgL+bgR
         c3syvR+FobZp8JdgMwWz1Es/w2TWxJUkOw4cTKopggzBsze+Z4fiRyu4IVpCllFQWaOV
         azew==
X-Forwarded-Encrypted: i=1; AHgh+RpjSBqlJtg8bMnLElpkdipemfd4lbu1f1tFbChRNVqxelm8MCaH+Ll5uluotZQHtdywrnooIoLcFys=@vger.kernel.org
X-Gm-Message-State: AFuF++nVFSZ5FgjGb4Ycssa3Y/KDk+mqsPjOjd+NN6P/PIcSmIh3nAKH
	G0MWhVf91hmvVz/UDpH9qiU9uI9j+Y+o90k7wdfGFZefyWUm0cNNjUoqOQmNWzr3Z1NTEghmbO5
	9yIoTrAIyQTyCXw4jijCwXo7OZSTo95Ek8KmiLo9QgUAYQrjRcl8iu/6AnVOo+88=
X-Gm-Gg: AR+sD13WhtpaKao0TPsd87bjCFbbDCZEiu5U3xoAekPsNhXlBzOU+XACXkbRGWjocCE
	3tUG/sQ++Gj+1mw7OzqD0+UHhMoHHDxDYq5t0nyb3C6TstCzP0ilvoD8XkG8ZfPuihmZJsvONSS
	G/ohmpyaGZN1uaOtYMbsptsrRoXh5jm+HsONBAEkkoHzoeQ/C5RhK05FSnesvJdOh9Ug6rZbYiu
	9DomCtJ7zZqXak6xJngOYhx/joqG9R1XAWxB+jVinumGtEKJLAWXSl9/RrrWMlSx4Lstf1DJ/XL
	lM96gRvv7lrP75JAU8+G5Pb69I7dtHmfMwv04PRcAJZTQd7x0yKIT+5+XEiGGxp6DwWBQuDZOgM
	kH6F/TjQ=
X-Received: by 2002:a05:620a:688e:b0:938:e95e:9377 with SMTP id af79cd13be357-93960fafb8emr542369785a.30.1788350316617;
        Wed, 02 Sep 2026 04:58:36 -0700 (PDT)
X-Received: by 2002:a05:620a:688e:b0:938:e95e:9377 with SMTP id af79cd13be357-93960fafb8emr542364185a.30.1788350316068;
        Wed, 02 Sep 2026 04:58:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm5673815f8f.31.2026.09.02.04.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 04:58:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 02 Sep 2026 14:58:23 +0300
Subject: [PATCH] MAINTAINERS: add Abel as reviewer for Qualcomm clocks
 drivers
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-maintainers-clk-qcom-add-reviewer-v1-1-dd6b6799b494@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAF4PmGoC/yWNyQrCQBBEfyX02YZxwPVXxMMspbaaiemJC4T8u
 x09VME71KuRKlRQad+MpHhJla4YLBcNpUsoZ7BkY/LOr93OeW6DlMECrZzuN+5T13LImec13lD
 erCK20drnQOZ5KE7y+X0cjn+uz3hFGmYxTdMXt99dKYUAAAA=
X-Change-ID: 20260902-maintainers-clk-qcom-add-reviewer-75be8b75b2da
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=811;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=JnRa08bIcjzzxfGRPFAlp0578fFiCK2SswzFgr9x5/k=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqmA9plxkZmxskLaVdZmpr+MI6QvMX3sJUaD5nB
 bCr5zYwPwCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapgPaQAKCRAbX0TJAJUV
 ViMAD/91ZzG9rjKWH7icSFiZBE439+2dyXxRg9/PTP4A9dXcG6GP3yv2rJ5EphkeZvXA94+dh99
 HLliDIpZDqrFZm/rultE8r9ZmcHO01zHR295CGfJJgRobaDDdoZ8hlFvTKFXL3QOZ7rUVV5B2tx
 WNr7iS6uACDIqN7L4lfcnSm+tg9+ysFLM6U7QQhvdtlkDCJEGVdLd1coeNMcv//hMKH6RFm9oRI
 sHdFu+GIKoHg4hd7TKichRYNjUuZbcUIn62LiSFr5hXeC6E8OE7VjqxGyOhscm6864mztYzsE6n
 yuRaR1kMbX8PttX5sPkLzwtXTDvcD3Go2ZDE+ydWStS616VN+JuB7CfMJ5g9nWF1gEsQwntOPC2
 MQrAwvV3v36WIpkhj+D/tqE1N+RZaVFfHy6IGCHAA+iJXF9BlsGEltaqDjiuV0XHbrkodmcZCPR
 oXSm4b9eVeSnvJwgUy5GAjLM4rDNCfxBJuidlrAHuYqUGhmfLh+3lONZOFjm7j0uRRFzShRTpVm
 iFza1+bxsQXS1vOliImXKwpBAKfVPxNyp7/4PUW1A19y+WvIfBxGC5bllbc6bg8yiiRV68zQtW5
 wmMumGrm2mIlnbsuSDv+aiakLvIytcm3siw/oE7IaIz0v71XdsvkckxFhCAnK8Kjt3HGy0dbTPr
 gEUFGjxcm1NfqfQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: oezMQ-Q1f--3LeMeFCw--nKvPQLcNdrI
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a980f6e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=-9fcZNnhvz7DZAqVOBgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfX3eBgqOevxe9a
 CX67YJxX52Q6pA5nHCkirebp6QPsVH2p9+F/q31lwPFP/58pICGJVwrtlhAcuXOq7XBEqkH5MJZ
 5Qu9tBTVOLA6IFlvO6MPtSloDzYcuv5lbGsT1OcTjS7Q4xvfvPfgzR9pmIubS0JJevZgNfI3Xe4
 jGJjPCmPbqoX8LByby+GIrkBEUZOETrljmEEo0bwh6v0KdJLlLDFT/ba3hue20PH/g8DAf48TEm
 BEgniTOei5FT67NorQSEYETaHbt4e6b2KcxOks1AAbh97j4i78mC9i4G5N7RgUECphAl5ewSOZN
 Y7M3M6l4Bd3C7D5QxeLZmqJ/fSxOu4DU6RuvBKvfe5eThaBdIGuGscz1rqEe2wuoA2YEsyvPvS8
 ucUlzALj9yyft6M+Ccs0tFyPYPErjuy4IBEwimCz6BDjVeJHzzq/2dL+XWA2MivrTCv+zmfNB/B
 FADHpRWkeYVZ/OOQ7BA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEwNiBTYWx0ZWRfX561cjXC+gWCY
 QSPn2I6Eqz9DYnze7dHycoacIOQuuZzqvCGodEs9H2hV6UrrwLeJJ5KaeqXx4tRYVpANLaO4ttK
 nLgqEdTsze/XQLNKtERjKXSNEkkgaK4=
X-Proofpoint-ORIG-GUID: oezMQ-Q1f--3LeMeFCw--nKvPQLcNdrI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020106

As agreed with Bjorn off-list, I'm stepping up as reviewer
for Qualcomm clocks drivers.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb4e5a61056e..e1b97740f20a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22386,6 +22386,7 @@ F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS
 M:	Bjorn Andersson <andersson@kernel.org>
+R:	Abel Vesa <abelvesa@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git

---
base-commit: 8b72f6626dc39b9e7e82b2721d4f7c3b86286012
change-id: 20260902-maintainers-clk-qcom-add-reviewer-75be8b75b2da

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

