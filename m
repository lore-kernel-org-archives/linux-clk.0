Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C14457E63
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390139; cv=none; b=Vn26IIaAzrN+JKP/P40NxbHuszPuYU3bYuPFl2rLJQhIfzqV9fRzV5atXAPGF36QgOhlaJ25Zrbf6VClLcIYcevulYjcFpdwXk4A5y77fG/L67BFO3mvtMpB61efW22DuRkEPXwys366cA42inOvVCiB2cdEH4q0GglTz7Oa3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390139; c=relaxed/simple;
	bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ETIP5k8Y4iTPkhnZQ9OL3bDCbPR9lXzl38CT/nBoVQ2kG9VYK7Q2OI9j3b59zN2RYPyWi5GOORA3Hw/2hEr6HboAiwTNMqBXl2ZXrgCQC5m6utfTdgkH83TOp3Uy78dVR05X/9vwi9VpqYB35EvilKtFkFmIvRZDs+8rR0sFeJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DQu58tE0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WAToQwe0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DQu58tE0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WAToQwe0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EBRdMj407460
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=; b=DQu58tE024hYOVFj
	T3GJKCntnbhqRENuf1DgxoLAhavMD9tcEwDhlIX3CsutJ9ipizQkZc7UBfsghYpY
	jf53bfloO0LnuHMnPLAqVu78fPOIb7YRy5IbWZ6iBlpkOOhE9AodDN21yP45vmOu
	wZDnr7YqKNabSqD+YrJlR+Fld8ddAPA2+cF/F5pd+eNsyf+bm754KiXe3jFwvioC
	gkx08/BKhxrxN0NKDrr/vigsodZHbkbvjFBrQCDjy0x3bvh+R3mFW+2O08PfP/Yp
	d+GkRDCzUdCz/AEs45txMNziU4C0JViAg/Cf5qmACkwX6Xwh5y/jZtGBR1eKzwAM
	g1SwTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2kr8a7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:48:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0050a554so532314985a.1
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390136; x=1789994936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=WAToQwe07ZdxADyMGY+8R/RViEgbQCNHBtaseEXln4ZaIJrRHvVlrgrHqhSDRr5ZDz
         hUUBf7RChzlGaQp/UjRv8Yqzm7DUmlpDpqU05ehZgk9fB/wTixdTBwPDvxs/q+oza2UO
         rKrXqznJqh7lCKpdNx3a7hCoKnmlH0YfKNoNmAAfqdyPciFtk/l0CKQ0wqWB/dJLUtNE
         gvZu8ZG7/xzk+Zk5SQIb0NvTbxyh8NMfdzHEMXrrW8XGwPZT+GsiPxu1azUjoEBpO/k+
         U5kXxCCkbCGhqG1r/NY16e1Tj93xzAAr3rzhsAD8kBQWWUspg9kFl/zZjxqUOzW+7ETZ
         hrRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390136; x=1789994936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGKiNls/ELbeGZ11s8HVW7d3CfdpdC6kiFVv9AK7pzQ=;
        b=ZCgYGXTBdmc0+zEBrMETSFRFI/QsgOzlmnWUvvRaMl0yyV14ga71zLLa1Et5+iIjKC
         Z0btdjZziO+vncHJcbQ74ULVO8DlWTEfvnwkIMF47nRS8nm5v8EpankQsbs7aLGQ3wqi
         7FU05NxjMBFyF9sLc+0V+NcprzdLhhCf4OXb8OMsd3W0I4EgW7qeCo4v/PUTIO92qINm
         aMyVNoMknl2U63WI91Nyuba26nroZ6SYtU7NoRreBI7GH+wFlugsGrU4FIY88BDvr1Qj
         rwPKwKeRUaWEIsDY/lDvgTY0cBB760E2ddEEQE8BCuEHYwAqTfxsiZBh+WVtE2kgP/0y
         YaoA==
X-Forwarded-Encrypted: i=1; AKwUvBze5ucoh7gqloGnyp4UEU4ChYjT0FeaSBzQGA0N7y4cTsP988u2BShD7kbAwojGefG8QBLldH6mywU=@vger.kernel.org
X-Gm-Message-State: AFuF++m9b+k/nzhJGkoZTqfzaBC4vFJCFjRBSBnj1c19i1y+8Cyqu+HN
	1dD1sT+okQuJj3b234Vc3ZuQyp26qpir0u8/OpwOWmXMXoerkOUqmyONSFIsd331An6x0IM1oEn
	/OkFNUaW2xwtjzbXbXQH0uy3UWjZOIPJFPaURMsAQbKImkDMMOljld+Uduzg775U=
X-Gm-Gg: AYBFou3yWzihINzgnIWxwrXr8SPU8McveAcKcLnSHh40XclvZJ5E6hKTjx8sDj3nHCK
	il7PXory3Q3v99TmVBQgKp8F8vwWyEEbyCjJQ7UGZpGpfD1MkwHIGAWeVlmmgzDlQGSD14KohzE
	IG3K5Q+wG5AbtlM6heoZgbOhfkTQMgNfooaWLZOG6Te2E1i2mlqSlsR8CzmD330nrk4Zkf0SBIO
	mqEWxmqngxlPqrLzLZNyqCmVj9dh1UrPQ2VLwDk26VIBWQ8pB69nww/jQHJFc5SLNNNieUajYxz
	9oieN4LEwvXJT49TnN3zi1dgkrzeh4dH3fWpCRAeWQzkieH5uOD/Mws+hr1k4r+oQ9cFzCFQmCF
	pBON/6HUY
X-Received: by 2002:a05:620a:268d:b0:939:ab90:8f6a with SMTP id af79cd13be357-93a298780d9mr332785985a.18.1789390135702;
        Mon, 14 Sep 2026 05:48:55 -0700 (PDT)
X-Received: by 2002:a05:620a:268d:b0:939:ab90:8f6a with SMTP id af79cd13be357-93a298780d9mr332779685a.18.1789390135120;
        Mon, 14 Sep 2026 05:48:55 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:48:54 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:19 +0300
Subject: [PATCH v4 20/52] clk: qcom: gcc-sa8775p: Tie the CX power domain
 to controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-20-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=775;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rlaDdwuN40epUY1QhKgOTaP94Fc4GH3BVIniMJyBXrc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zfyoPSHKm3051QKmPlzZ5QodF58L2g5onTL
 x/BbXh6zR2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs3wAKCRAbX0TJAJUV
 VvSYEACqfUW8CKQOnBTPUMKNTG9lY6twe2HpQg6SwCKdfbAiLS+5y+u8aOql/ykk2A7VadPCRvM
 P9OgWQr9+dS6UOPr1xVlb50jjgMfl0ImDLJmS9oQZnBOmpvk+yv3XxZ/umOCHQL9YODPRuK1KNp
 bQfjmYckEE/U/Cg+bAvf9VvkY3FzBfbHNq63EYoXmCA9NxoIr3eNgmjxTO1yn4EHCjHIEPAXAcM
 YPkVwr+bfeqUIAaGx771XMFWL+qgqMELEeY5P0K3UiLB1pL4BLAjtHW7vbhHSr+HROIP9rvcwY+
 nd2yXlEcQFcEyDztGgLdJpFffTESiS1zTb6hGYx2h/QdVSRKqNCSY9HA7mou2erT/wNurrfHwiB
 7fNvAzMdaQsArqz9O9wD3GgPttCPc54DNfsGEYAUKSLHAT3R2MNhGGHY9ibEOgUpNX9J359iI3z
 pNw3vsbUby3JzZG8yrV7KUEkov6UZY51S/H3eLP/+DxXGHXltu7VrQQ0Sr6SIMF6b8rZ4eCY94I
 CVaOTRe7jkBy9zkvyLKIz1V1J+M5rPQbVTo57RG9DOnANvDOA70sX8z1RBpKj7N+2OjxEOrsDl/
 NAME6Y/D0td2f4FrTDcODZWpNuINSDf367fScbpnWHAVyEqvPTX23sKmwurMBVtSAvTX4lgdJfv
 gTMmvkYA5ANMp5g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: LXFSazsrxKIITFysSGulluwbAjksOTA2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX3JYuhwkiPhXf
 mhOeslaK5s1/N8+ioY7SvAuZgW8iLSvv9ihHfHEiE76LVoN9xS4PVGWnpgnOuHA2TwuhFuswRwo
 +8A9N9eT90HiMO9nNDEMi0F+lRuyExDTqdjrS5xN4i3DeFXcwpL8C78KoyKGf/PMzZ4Qhl2oLgN
 Ql1y+LgNMM4VrVmzBzNMFQ1CPXIiEmjoDgpfcI6zDfK00XWrYDgfQ44i7EpVvfqZLThAYm/oWlT
 G7vDD0V6S+8RHjVr5neofuKdpCxBT0CC+szC7bIuvpjXOtaZ5z9LDjKHTgqjpgNG1mxH+GRmZEe
 3ybMMUI3nBkdaLa2mKl/4ZZXiror68g3HYUAojSDLclIMDNhxzH6WJPI9UuGtE0rA+jIR51wqjI
 Kf8us28+wxkKUJ/Nhkh0rae+Q4Ajw/WUclzOawBlvDjRGFozpd//w4N7IaHbZcLE0LUlrcOTSIB
 EvG+4ShxuVxblF7NaSA==
X-Proofpoint-GUID: LXFSazsrxKIITFysSGulluwbAjksOTA2
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa7ed38 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MiBTYWx0ZWRfX8gTn6G5kvD2x
 hxzQHWLlbpnwUDuJvv19jnx30ilWb0+ICUhIWkVphO6F2axEaEEeObQsl3JvDDW9p7e0pwvP2H4
 IWZTvFrRkOhSGc3TmsARojWEzISjXG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140182

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

