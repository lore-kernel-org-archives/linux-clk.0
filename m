Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D05841BA9B
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572550; cv=none; b=RrfWG52EGMp6MX3wuuf9mt07StMjbY6wBw68Kp6fvvBebNe+axNO2ydoPKXf4AmYA1YR/xzcNE/mE2h+EigVHOcZSKUFnNA8mPapkXNg5c0locI4ypgtsIoIhTRsQUlyWGlG0d0cjuNEQXXK4zSSVBRamcPwCVOUaRFIyCX7ToE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572550; c=relaxed/simple;
	bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J8VhMu0iRFIMsVkMVnG9BoI41QmBtArgbaW/5TrGEmCwc0xtMJ/XmH5frsDHoGNVoFO31dSdySO9CK1HZfD3YbT6GLVPcE1wySQkzHqMuMrUHnpdH8pZPuzO7ehFFKgZYwLGxjIv0xU8ug7M+UCL/qJWXUDh68DzcSH04+DlXL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCcpCEH+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9wszBf6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCcpCEH+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9wszBf6"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMOSj3869702
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=; b=iCcpCEH+Hu+wpz6n
	wkP2FgB/T+nSWiILXcNcFfwywiWQMMXEQ1o/MMpoH/xx9jZ9/BwztI1pv+ZK5L6i
	YTmrBnIR/O/kGlUwAxh2bfs9q+CPxSaR96qFuklAQJwX0wU4kw6yzsaXfNdtZ+0I
	yjjz1v//qNKw5ookBYsd3pIqVUH3rAm5r3Yww/n1Bk/Q+3XbFslArVUXjEMSvDxe
	CaPjlkLtC37aH74hQxTjAgcG6sdCHoEuslKKW8nG1ZU709Jo1AzPxfwtXjuHVrX/
	5zGciuFP4Khy8HEWXpykjgnSn1DkmoNuBOHztX83Vl8kIIOyoJ4OBWA7EqkXWYB+
	pnb0Jw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpjgwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7b3adda4so35333071cf.3
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572548; x=1788177348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=U9wszBf6PfC101JPRH6SVwhQiq0Fkt0+pbooqhosGsWE+k5czbFVas83k4SmpiNDfy
         J6ibuX3+JY4GSo+x8HSJxEUVn4Ox5kDwXzM/52/sKOVWAJhXFAxeKv8kjPx529Tm5hbj
         +xjI+4jHoZPuWmISrhbxde6cgKLNRF/0r32o26zhtsxixu5CptdaWm+p9doKGncv/0/Q
         TXGPCksTbJTPZ5Smzvmt7jtYzQAFPWf9zjOkDhEx6oXHfUaUO6ZleFfdZBOaPe1iOpid
         gGDrfr37AdFvVaGQZ+DwTGJrtGSmI2w5cKdk9UnIphp7t9MEGzHDs1djxZdiRI3H5WH6
         TcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572548; x=1788177348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C2/nMFkrCibaCpmHbRubrz8xIBK2adnMTTa8d7tryQI=;
        b=YOoY5+NGxu6kZqfALCLllYEwDSp9R7L5HEp1d9XMPeVfHZvsgg1tmVub4F6R0Sbqph
         0tebebmKXTYC8QGZFNVVe2NTAkVSSiCBPrKePnYIcBwAyzBgL6Nru92FOYYXqrDYFgsc
         gvmFgI2v73WVYRbChmNmW0JvK8SG7oII4uRGESPCJHCIUV6hahZ7wf9iuKPJtKuxBles
         qwBZnuh6eu/GxOkb5kD/qP7yBZUfQNoTUR6OSsVgT5Xf77SMmTtQtb7GCMw6FRn8NYGE
         8G+xZdQyKITvisb4ivUtlCG/DBIofQARmx8QVd/fVrJqD4toMu1h9BuHDJwriQqPUvYj
         W8yA==
X-Forwarded-Encrypted: i=1; AHgh+Rq96zP+RUX8jQb2MRI2qYiv88/aMAnsta/lu+flGu13G+SRl0ruHi4Ox18CeAeh06psACxmiXOgY9M=@vger.kernel.org
X-Gm-Message-State: AFuF++nV2upLr4Kc3psgCvT4njU26szwO5EJjQZINTfP4nj/0VMjhIEV
	JyoVlSIrj/rRRgQqpQt9QFle6CaAVT2vpT05R1T1cNuRTDI7j+T9HCAsoSLUI8/bSBEBfnpO9om
	y1uSZBopRDaIBmlL9H+y3/w8xuLogeWNa8eotHB+P2W8/7fzFD/5fBMBo5s0tTgA=
X-Gm-Gg: AR+sD12+LPo4b0uKzX+GIEbcJ+KiWXbbHZygqALapoCR45ll+F355s0a6mcIvs/LuJJ
	USARsZUuVuHMQDApuDxEO0pScYg6shZEFFkeR9dAiiCocbAHyY9OGk27uw13bYu+FIUGLfFa6mv
	zI3eGxo5fl1Kj7bTucjmMKqitLWrQ3Heo9coz9BLcqu8bYgMitbnoOZh40R6+bjASFqX1eVaZgc
	MSRTVuxKrrMtELzGdKY8YIcpsNaIN9v0FduZE1xiU2HbTUSmLLbdlRCq7bPXvDoGOCzqTfeKFhJ
	L1fq251Q/jc1rfZFvOSe81zRZktRGBxXTHCvnA9uexkn2wtxKNdqi59Trbu8WLGDp+NaKY25RCg
	S/3Zxr8Rr
X-Received: by 2002:a05:622a:118d:b0:51c:c6c:9d65 with SMTP id d75a77b69052e-52df56e112amr227060311cf.1.1787572547655;
        Mon, 24 Aug 2026 04:55:47 -0700 (PDT)
X-Received: by 2002:a05:622a:118d:b0:51c:c6c:9d65 with SMTP id d75a77b69052e-52df56e112amr227059721cf.1.1787572547075;
        Mon, 24 Aug 2026 04:55:47 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:07 +0300
Subject: [PATCH v3 20/47] clk: qcom: gcc-sdm845: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-20-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=0KiiHZTi/qlr8qqnehNkibdGn4Of38rmmw2GrafGWVY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDoqGOjM4M/KdfqR+TXX8+XA7qU6PhnY0DlV
 +jnMZKT6h2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww6AAKCRAbX0TJAJUV
 VvWlEACjp0NZ6VdXl05mtX4sV4htU/1OC1a5piEj0qvvlNvS/HpumKxzpT5LruehcOSO5MJWcjT
 OE5ceZF/GwvmDolkS0jQmNZZmY2zHgKXiHQusBSHKBqYG5v7IYaZtgqnZXnCptPPmsJJspNeGUm
 54uZp49K7NK8VH3bIFXnW6Ddgo7334xYErmWiem31JqDN8rVbUfSqff67YLFe+eMxomrZZvUwSz
 +BCYu/eD5e5eVqyvLhKtfHTBXw/ra9XRTUDl7T1IJOyB69cP6U6AtvoJk3qiMenn6UMLpWfJwTc
 D4ACQ10SSxbBnhp1QRsnDW8WzJbOqnkMj3D+xOg+zFdr+btGqbZ1CH6+zTChQvhVsKVKXA6y18r
 5abxtrR7YNtmPr9o+aV06x+JYajZsuEMJLLVh+Z03Wir1DO9uRTBZIKxDC+FAEqt0ppPAl46J7B
 5StEroBhkuTqOaKeCqUVZRIH/ab4N7i3EUDMyvlncLnNNQgWtnhTb5No9LPcOrG0EGoYfsCYUW1
 qeFDZOaTeMmFzr1OvryQYnsiyTcnGf/afBx6XrIcKFBe51UmUuLo2QgQjsddSfWFkEC9zkGoDbi
 b5qswItqXXHy4mgap3hma6ZkQxsLmEVE2Kc/n16u+5eSC3bZLV4MvN1z8rRUsQr26MSCnJCM/5Q
 LTTgM9du13NkI4w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX4A4c1yJcbUXp
 nQ/h24uMFiRyB+5UT8QKEXLY78D8nZsfIp2cJ3wbU7PogfAqa4vMlfhUebV+9v4NPxvZeIWIbI6
 6HXEZfXxLxHJjqyIqm8Oc+mUpB70dZcMIGTUp3St/nRx/35+LR+O3pyOFH53dFWAIZit7dDL7Ey
 EjFXCbhYkW7U0R6F5IKCYJ/b8io8kTejQJGzbGY3AoKkapOko/M2E4Qfpf6bTjDOJKkEGR8fnza
 3yJoFeUDJSJjBJYkDjIHFj6XlyJfE6+cAbyg10C6o/7ZzjCXfkbKZHbpt0vBx/jNz/wz26sZBK9
 ECRZr47MQG6CpSOpAYqhgPmuR4cYkkMh7R3s6ShGpHWPy7XizQG6Z67/Gg91RWHGI8Xabvywioe
 yocdwCtxqkGmx6gkvn4IOK8/hb1Lnunq+U3O3quhxslAVbAEL03dqKk5JAvsIvnghtw9G2IF4Pp
 +jHrP/DlrFebcP3u2Iw==
X-Proofpoint-GUID: F6yBPZuE2zoYi9yqZL6ZqcIDbx2daHWF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfXyBYxQFx1qr4F
 Vd4rz1dmoFIN5hrEiIO3SttcshEeFVfWfB2IB8AZFejj10rjPHK/Z/JGlNepY2iFNrslUoiqyqM
 Q/J/EiwNZ6xbfz36vHtEmlwJol0JUUk=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8c3144 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: F6yBPZuE2zoYi9yqZL6ZqcIDbx2daHWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 57d54b45fa52..cde863dcf185 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3959,6 +3959,7 @@ static const struct qcom_cc_desc gcc_sdm845_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm845_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm845_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sdm845_match_table[] = {

-- 
2.54.0

