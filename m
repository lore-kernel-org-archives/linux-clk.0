Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED76411F9F
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572532; cv=none; b=bM5DTi4St2c1US/cz2pZA+9o6fW13eCu53weZkIk+6hnJYPLBgzdO1/wLDlgV0eQVAZ9aHwGALqG2WSBHYrkYCjCzV4WSDUf11YNphMz8MkYOAQa2SMVe6Hlg7zJC+CyfxWl+Qyt6Df2wza/EbcxVZHFSwtYaXzgS5+WHPgG7Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572532; c=relaxed/simple;
	bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdmay0uAG0wC4ngDya8kCR3n3Dlyige04UB3SxPudsx5oWWrDZkbtQBizgL0c6Opr3G8F3AcW7eJn+utEVlRG8DY/CuYoquJZcftkG4y/ncOeh3Mi9p+RJj43fNXSA40fNllShpileUjJCoO4FeRnqOemzpmk5hcKfHjR2UHxNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCZD6orK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cStyNrKl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCZD6orK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cStyNrKl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMeIb2372617
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=; b=eCZD6orKtKTiR0FU
	HYwrXEJWiynf3dDT5oIpSos3x9QFZwqJamGsNL76r3MOp7OAh3s1sV0X/xdaccKH
	CJ0SIu78KKaEzD7V2RZPffnn723ZB9V4rpSCgBkTYOfQBuyWuGztPIfrxT+VSLQa
	50YbzjVOewyupd28/fiHDJPLn4euq3i8EdVD2CD/oKXsl4XXzwBN4hCevVbZWCqU
	Mq1so5HFXJf4hITLAmc1VCiNFQoW8ZT7WcpSZYlQruKB1OqqccrrDWF+Qd3vZeoK
	5f5Fw9ffpE/ei7AvoEjpZbXEIsDMjkb2W9/dtdib5I6hyLfaj++HIQmnTVYso1XA
	um1PoA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsheh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:30 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so24265126d6.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572529; x=1788177329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=cStyNrKlJeGUrGFEWMVZDsudd9Gw9bo6meQnoh+V6VLO5vmsLa56pJpSrYW5kfLrIQ
         JsC5PiOI7q5KXec3NkCgZXLwSqbs1B4coFfy3jCnsL3VDFMAjcb+w8QmBNFbBYZKIxmS
         vTyk21zzuBEXGstaTMzYvH4V2hVn/8eMb91JLXu2Wg/bKxtgn+yGZXsfRTpXjnq8URXa
         xIzLOk143bPZ7u+2vNJGPAxmQju5MmeyKfJ0GH6zRZEdo03zsg2S+D2ycgyhfBTA+HsO
         AmP6+cCm7m/tGXGVwAFPD2illFB02Q/SKZIUw5I1g+ljjVfNs080jiyBir1npchmeUNw
         bxGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572529; x=1788177329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=OthxFOtOX9JL9QteLMX/s8RYvWVbDLSVs234qy4EFK+jYPeUjEj7h/4p1caleiI793
         e8QgNWUg2377553+wOCseZ+U95m6O/9xa7fSfVnnwr4f8bmbensKusuBVtjt38WhYf/c
         aotIxyCw3KOxxe35IOw9uZIvvG2S/Brz1ahS3c9sG070GOjFFg52bTZoCxWYmeJdowzi
         2pClKhT4Udum94Bq4JIcGwU6ulCiDJoEf0j3Ib4UzgRPNby8UkqZQdzB6yVisxXy20MT
         BlFeTxUw/hNwHSSPQuGw9GKaxJEnWGcBbChqj2JKGxErWxUwJIR7YUot/iJYJXsSbY06
         ZBzA==
X-Forwarded-Encrypted: i=1; AHgh+RpLQbWrWOwam7hTH1ru0bNwc1eZ5njbEwO3JjPtG4wV/Lu3e2VJoT3m9YoVwBPh7Z5olcUJxAWChv4=@vger.kernel.org
X-Gm-Message-State: AFuF++m4el+NpU5i/X87HvWt0E9haWa/rB4naj+uapBTYyuuIC3OOyUh
	POhvgJRvcITssn+/hGVbXdk3F4JoSZnIPFYND9Q3NrTKvMt46PXr42Pgx9YKxcWXwGj/pt8utYH
	QivHxvl3Ctaz7L5Sm5ALrRm2g3rbd1jwU54tEly/q5rB1CIh6yUT01STF8mAJiRQ=
X-Gm-Gg: AR+sD10tN0rLgQTNB/CDW8Jzg79p0GM9h2CvjXWyIPWNmeCeiniIeob+JKBgSnvL+LT
	a8tClD5usfmY1qbA3kVzlAWPT3NiKu4tMVZlohKltW7oeglpkIVoOapyRweJHxj3g5v40XnClZo
	bKBy1tpRnBq6KB3GOMCoHWjLncSiJv7aWnhTZkiUmqYeUfK9BUGt3o30PTNEpJ4cfJsGZXIPDqk
	32DdiicdOjMJnk5X+6+qJ42e/OHeCmU/NYKQyZIn/1w/UFDuDQLHKEDsfx/7tSWLLqXm5X8loy9
	Yqs/ZJrkN+pnBrFEZKb7nSTbSMn6V0EU4Q4QiKELtijLZ1ysjcaKERPfU9Wvtpa609lzSiuY7nc
	ljj6jpCkR
X-Received: by 2002:a05:6214:5906:b0:8ff:6304:da9 with SMTP id 6a1803df08f44-90c809c34cbmr273380216d6.6.1787572529439;
        Mon, 24 Aug 2026 04:55:29 -0700 (PDT)
X-Received: by 2002:a05:6214:5906:b0:8ff:6304:da9 with SMTP id 6a1803df08f44-90c809c34cbmr273379516d6.6.1787572528816;
        Mon, 24 Aug 2026 04:55:28 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:02 +0300
Subject: [PATCH v3 15/47] clk: qcom: gcc-sa8775p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-15-f1205a92682b@oss.qualcomm.com>
References: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
In-Reply-To: <20260824-qcom-tie-cx-to-gcc-v3-0-f1205a92682b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDk9EKx2CK+REMhrD15CuB1Bm0YzdBM+len3
 KGtgx07HGCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5AAKCRAbX0TJAJUV
 VrgZEACABx4JeD9/rSC+xgywMg72QE0Mv9tc0EJdfy+KRkf1NOZfMp+gTdvq8Ycmil+o737NirU
 jkKZar3dESkBSmg/Xu0VYtNX9U3yM6Kf0LEiltjTdZhR8bLyqUfuUzixtJg0DVQwJfxRk5Ne5NH
 Zd74qH+obCn7cCo+ZwkKPXF2tfxSRiB8M4PB+4OxF8K1u262s6QOAOm/XFcvUX9mwI8iAHRpcS8
 7+FSPDHmbWN7QwsyvRXKlDvy4hE5ua+vnhG/P86xoNmrEl8L05EyCq85o8Hg+eJ7aWZrurYKXwR
 YTagveswuGtT77LkOVFbLkcG1kg085jcLbJ/jkg10r8HcXAjF7z29yQ5HvaYnuP2fseAq836dml
 TbFjjH3wc+phIzV96oThl349Bk16USWQIjHFjwqFVwcV6UPOUa+Udmp4gXp3tEP3CkOHCIAR3m3
 fpgCV7Sec5fwr4jzXfH+rq68eCh7axzrB2LsJxmRVTzVQT5Lx0Ob4QtnLCv9hF97EzcayWQRnVZ
 3pXaC2mEngOI3SF5ZbSGKIvf6TMpw4D98o8DY2DkDrPfg26k6/D3s9cgkx7vAxBGwffBRYKgE2R
 D3eOiGTHX1PVSi69Dkf51rYRfqPIKUOcCc8kK+uukz8c56Viv3YbT32tr/cyRYp/1D+78xWDg4n
 KB7pb21rpW1r6Tg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: GMbv1SHPRq58x52bfCUtmJEDJIu5gJ7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX9ni4QT3X8a0f
 CzlF4LA5c5laJNDZsbYcY+V//LeLockZPYG+sEAOQlKp8pHEgj5zWR9//TliIKcCUjhf1Ul+sqj
 OP8Qf5wg+Sus2z36UpWPHd2YnPvEQcXZQgqwdoC9hX0FhqMogeGFWzbWbp79DIuNrmsEYxbsFnI
 WEYgK34fRnMsyxxH+91G1xyGBnGsBLMce5aJBt7Ft04LZ4sATVKJgszE+wGGWJfxHlnQQRzt17r
 F2Nf6BAO8cp8/VvjBQoqoprIq+xvjTZBuXeGcsfdRMys/97QwlnslxH9yIKD/GGATiJ7SQLJhhG
 n5Zme25IdHIKZ3v29TRcDnljsbf2izcnEALQdyx0OQbCsKPQmOF+eVu/qiOSf530qycmmR2kpHb
 jXBZD1v+uZSMbx6oj8wyfp32Yq50tP3nexB7TDO0I+8MH0/QtHHXAHSWj0yWfzvF7wrDM24NRED
 7eSz4dT2sgN7qNVOqMg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c3132 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: GMbv1SHPRq58x52bfCUtmJEDJIu5gJ7A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXxPvI1ZDvXayU
 prns2iOjqlDiV5N/6o6501MEBD1gmpy4Q+8yO+3xeUSLNr6UwKWw5pMUGlfe/I1UUttQOdhTxNg
 Mh7mwQijdixCJ1YJT4NuwvaPzUuGPI4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..2f867596bbc5 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4652,6 +4652,7 @@ static const struct qcom_cc_desc gcc_sa8775p_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sa8775p_resets),
 	.gdscs = gcc_sa8775p_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sa8775p_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sa8775p_match_table[] = {

-- 
2.54.0

