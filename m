Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE4A414A16
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572548; cv=none; b=V0s4mOJTEV0+3wfjm+oJkrEZo/TMqF1Ixdgzdj43BQ9imG9i8mr8l/nrATJjAO1TNvyyIYpaoG8bU5xGOR+jt0jh6RNOWAkX/e4v7GFshJLIiA72eUk3wi3Yrt6N+Sgxgv6NcTAw+WIwuIzrt8oJeCAZqLRozve1DIVIB5RRJIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572548; c=relaxed/simple;
	bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H5yLnyRyVir+rIy1SgpZApkRZ6IANqH/nKt8eHKVqZwLQNhCahlefqATgOjIJ3jh/30RItIbLIqEqYx9Nhp//GePExqhbq4zNIq8lmGyCLdQ/klhHNO2Jq97YzB5c3IC/LfduFZueXOc8mW6AID63qKpGD7/aTQk6EMJUaEJx2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BbDwN4Jh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZfrnF8BT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BbDwN4Jh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZfrnF8BT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMPZT1800149
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=; b=BbDwN4Jh+Vsz7xJO
	umA5bGk57tpH3ZWZLGMOraj8fpEJa1pTm6OMN9OyQ9haCUEAdVWz0Fo5qLSpdbmH
	vQz2TqJXpmGVBWXMSQ2EKZMy+86UtWYxA7oQIO2Uu6PlFlsztoHD3km0EU78hj5r
	LG1JMGhfRcM9vnoVCmsR873NYNrOxUt80bdYVzdKoIEeUR26IrIDX/ZFWgslqLRZ
	YG7dF7NEePEfndOI1WjuPM9z34fBF8+g0oBlJTtM+Zukj79AXwtRAY3bF9g2ZkUP
	PPU79Po6Y/xRX7OofI7baitad5/meBqMxNBJPN7r8BobuUHd/kGjJLcDZtQYcZGK
	jdBrOw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv78c24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:55:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso60994401cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572545; x=1788177345; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=ZfrnF8BTldY1Y6OI0c/H9YMjPE9A546ruAnagU+jadLq0Fx9PpxPbdi09vMlGNBb7z
         Wz/4pgcTuhvSQvzEbYAwQhOEAu1sHHObVeagkP6WJtQ+bA/lgFfFgMkIJcvTi1Uzy5ZZ
         yfsAVvDMJsQYF2NOI2JjU9BFiOw6eWjLK4ZC/iTwVbtV09Vtvvw2ZWFHfkzxLDQ0Q2IH
         JzWlKRi9mnE+8+O3le0QDICGL58v1FuMvJbJM4OEEsb5ZSmVGNS/dRlHfoLEKPvQMWsK
         HdnQP8DOv71ek6Z2rvpgyhHpCzXYq/zbVQrOiHrfM0LBUrYbpNF3AVf0a/R2QmyDRH+g
         eXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572545; x=1788177345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1engMRsfjHWG34qUdnnA7Naj9ZgncmLB5UQD0m4jII=;
        b=LG9caNAPYSLDIGdq/5YkPj9/T8daySI0WBOwGktCVxbmxV4+w/cuTNS+wofCbXndsJ
         0t5ALZbY2ek2TYEUK+okO7nUXhm+sTDOlz1f97yBs/LmcIhPy0X7qYQvhn0oXzJ+NrIH
         rdJ8Hb7qXiLdeFqQHZc5YDJnjSwPTTi/ZAr5Grf0juzeiRSOKcyGCE28TkV3jl8Gi5kF
         oAhnKt+iv+XMM6D2iH8lBJIe9eJu7fWrZiN0CoM7Cj+m3CBGOt17I0ZlHxR8gzzyqBza
         KoXRv9SafxBHUaQdpu7iyK0Escnsskme1OBiKAKr6lpayW+Qg/Hk1RVC2wd6AywXzGlP
         jdIw==
X-Forwarded-Encrypted: i=1; AHgh+RpDfGuUF6OdMR+vxPlbhjVycrWeDtP38RuPmhijtrZmn318VvoYrvlIzKRUFveWx2CJhXG4TQFMZbQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n+bZrghMdvBg9bYic6ImXD9Z1hdkGmPPUP3fFbkHF73uXvnYiX
	yB8NCXrytVpwuZabhQM+4RsGWX8CoTF0xC8/UIwAqUc8ob4EkX+rYtdixvmn5kZ/uNhhXha8vJ9
	KsxJu9jUt9J/8Shq1YbKnmhnsSbwvKUu2o2pXKHojENYlx7x7d4ry8vc/g3lb7Pc=
X-Gm-Gg: AR+sD12JC935ScssX8GyGVyGZovicB8haIvagod2uVkM2u63m9RPKfKhd4HCcJTR7XJ
	KSeWXAx9AUJUZUi1P75MHpKt5IPzIfjyq8OgQSoIHdhWdNqbrYpbWqpIwD93VVD8gGp+4Fq5T1Y
	n8idpA07MdyLsWAn+EK1STCYuUB/E3v2rDeHpO9hPa2ZOJqY6eWN6KKovkVf/qo6p9/V0i8mQvR
	v/5fmmb0IIKU04pXHdgNqMo+ZoQKo+1EghYzlIyKMz9XPXaEReN7YiO4pnrrl5I5+K9crD5uqyl
	jz7E3i5yTM70TDq/GSlf1mj0ly1/ni36960VOYc3s7jQOqse/CAghourxFYtjkpFs/W8qxBxqFc
	oJOpthmFN
X-Received: by 2002:a05:622a:1456:b0:516:d83c:edb6 with SMTP id d75a77b69052e-52df5692459mr239115441cf.12.1787572544886;
        Mon, 24 Aug 2026 04:55:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1456:b0:516:d83c:edb6 with SMTP id d75a77b69052e-52df5692459mr239109021cf.12.1787572539399;
        Mon, 24 Aug 2026 04:55:39 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:55:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:06 +0300
Subject: [PATCH v3 19/47] clk: qcom: gcc-sdm670: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-19-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=756;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=lRVKUqTPpCGIoNz5KBJv8zuvxjlzgnhVsGKzfTzKUPs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDDnH7t+SC8XBiIl0Utyfmfs5AZfqP80p+fUp
 +5xic0k/WSJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaoww5wAKCRAbX0TJAJUV
 VsX1EADFq7yn3f9PRnVu3BXzqwYP0Yc5MVfyCCURfA5sC8JpIcx4kH26rUc7S9arKDjM9PLCo/I
 VvzSIQqwXIP6bdokrlApVa+V2QgtmiGO8mRE8ExEfljso1GSugr2d+Jv7wnGn/D79lS0dc+yY8g
 a/sACixX/P+/Bw/79htVp4M/MAkPW9xgXwsG/ORkXMi6muJ88dwRUUrdMUSHCiFbRh8Y+6Xo+jU
 mdjNG1M4lUwGQHhAIxe2WqstxTAfrFsqZ1wJzoX4LC5HzVhYEGDe+Hqkpn5/GGFRnAGYOYOdJIM
 AOAvDtixL0CWjcX3bbGfps94l5uML5q21wweB6Dm4Un/mnr8EmyOz2aPFA9ToBQXGMymMIRjrxO
 7Lztluoi8p3d8GW//sEkv5PkBjrp/4mpk3XBDqSMdPHyE/wPEydEChsQ7q2gkjNMIsgmJhRbb61
 +y36JuGBgTJAI66XyjZ/IVISLsTCEaNYLitErKnUbnfAOwb2XPVWheXxWOAb47uM7c3ru5/f+oz
 +hTx0cg9mOomyL+H6Z4IP81b1/DcQ+XJRYyBosycpfTC/G92GC1zN+IM8fLf5BIp6hlrAXZ/IZj
 0HYriEHnhiRh3XJm3Pi/cNQs1NUiT2Q+lO5JHTVYy8nkVhysN7HQFnOQIl5eaTKUDoJ0vWNxLIw
 WYXey4UsL1mKg8Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c3142 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX5J0myBQ7X45F
 mQ1frDdWXfmPijNLOkvOQQebRFngZkvGE1SNuE2EEaCTfu65whCovLnBDEoJW7pwm+dm7eaVraZ
 V6mLt+W/ri8iizd3QtA+acclsZxm10Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA5OSBTYWx0ZWRfX022jca83qlb0
 WYK5kC4JXmjYndqiKLikQB7+sQejJ6QupdJvZE4cAEVoQTJjgGVN5jgQOxxFCWz76sU5QNlgjwS
 +Q3uqIa2ctnkzjuh759qKl1akfYDjX+aYez+byldZ9uxN16OCEcVkISm/g9v2FDU84JzvcPWTsj
 8or328zvA/y19Rt93HEjwdGubOrx7f/Sy50q/PWvhmllJrz3KwsGUcg6gpjQTW52g8LKc0p540p
 4hWWmzzGaz3DQNhLe+8tDDYZGyXajWp70Rw7DxSPjdyg0aH7mO7O6WeNi9hkkre+L4reI86HK6r
 fGQL6pJc6eR/EgvN6pSwFQCDzU2M79yRvHQBqb2CMmLYZYcypiOyUs6sCXdC8eSHm4gnH+DXma5
 lZCGWBvsDoshV7sgPAkDMYpefCpzoC8Es2tMEQcFhTujbvpXVTeSAxnyg6U7bOyEeIu+Ognpdn1
 nOxC6qP5d8kIlTpbnfg==
X-Proofpoint-ORIG-GUID: sUXVrDQfov0KGXJlyVPF2C43Jbc2_IjG
X-Proofpoint-GUID: sUXVrDQfov0KGXJlyVPF2C43Jbc2_IjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240099

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdm845.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index 6d0f9cede5cf..57d54b45fa52 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -3948,6 +3948,7 @@ static const struct qcom_cc_desc gcc_sdm670_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sdm845_resets),
 	.gdscs = gcc_sdm670_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sdm670_gdscs),
+	.use_rpm = true,
 };
 
 static const struct qcom_cc_desc gcc_sdm845_desc = {

-- 
2.54.0

