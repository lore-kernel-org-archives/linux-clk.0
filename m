Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3240A432BF8
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572620; cv=none; b=Qwh5Y5XdOwV7mNuynWZegnTdUR8CzQKDXKw1N7nxC7rFBoLcdx3FUcU3nzGi4UUnm5pXS75aPesEuGll6WrVqW1xVhqIWGhhVe71LpqgynRJnmbZkIHc96IcfRCro1aVnefMb12UJNWpvWvodFNRuFc7vep9zlNc9cgHTlqOQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572620; c=relaxed/simple;
	bh=kwoe9cDJHyiDxCz0G2t7XYacMKY7IbgYwFOuciWzpr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Uk7a1tUVfN+kyPilagPCRq+n0Ic5w63duB8qPwvNVx1zqkXxaNO0l88Z3O1ZVG2zvgYvxcd5VZxpm3G0qgUkiKM7hevCn6jpbDUeZbUqH5dCIoZiOFdFqvDy78NPU0k0qx/ibMZFZE96C6LfSYgjAhCDYc0IWxjMvqjHqLbSC1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E8q/GYOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MZnXwlk+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E8q/GYOH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MZnXwlk+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OBMPwR2743036
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=; b=E8q/GYOHkx9WyMu1
	ZvCM69hFQMeBs/FTFSKiNHeSbyqkn2XeFJphIks5pHgVxpOUr037QcvT+THDIC78
	q0v9LHfpNzS8aCd3fDYiVpKQoCoFbt5uyiiQ/cGuHGLtodb4YyPPIVXJSFRumLy/
	/c/1/kCUFeAKAmKMFSr72pJBxO7wG+CNwnysbfP/kuc+ClffQltdL9+2rJoclHNw
	5D9X0feV28t9AOSPmU/015BKLzmGVJY9OJu6Gntr/AtP5upGICgEF/NOLOVwxjJl
	8WzlQTj+SgZ+Ltgqx5lLCh1QQkrTIU2jth9C1x52XDkHvwP5UeySA/YBtlo/d10i
	LEznMQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8j7r0x5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 11:56:58 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e9489f62bfso40066046d6.2
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 04:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787572617; x=1788177417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=;
        b=MZnXwlk+34mV5H+tVwL1PsTZhatCPgnikrGn2FVjUJGLuus2t3b1nQQxgFBDVpXoj4
         j/H+3lm40Rsd1FQfOao3Uim2T2v7l0hJXEr2832vrr4EQF5cofaPI0lw51DgAOEoqKfD
         E0hPTkdt30pHDt6FXm5kuoOhhQevjqXKEhvpyS2ytooqEu0tBIVdTjt7uEhCY+bb5nfn
         dNVrg4HCxYe4800M8kZwegGJLlXMv3AnzHiJHv92APP7dnyCVZJc2Msw/6XL66IgB1bS
         dVm1ZcOsSDy9u/daWcvk19bcEfU5f0oF48vOav2zjWewy5j8LWWjf1Il6hz3Rud+gwzj
         F/7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787572617; x=1788177417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFBlWjhx8TjR7emqcNSFWOI5z9JSSyOCX9bxdec/40U=;
        b=FPLFy9BfHqecCU97vp2b9xj77/eZbCEWaHn4PLg0wTCJKRoP3tcyDgNaEF55IcxMo6
         uR3rk4oaLzS1jG6eFdh1R0kmt6RSQozRfy/vcy4vZFJTN9so5A7HFjgNlIp0A83fsl2n
         mrL99Uv/3E2Te1JmOzIeqQd9/DAYnfIxctf3zOqmSAwjuNcPrU/PC17eB/3qgAbxot21
         f9nScIZQtsXg11jHh0iUi9omf0q+1+ivTQsdSHuGKKbd1S3qoNPX0e055zh5grSExlR/
         EXOCno7MRF4Vii2Gp5vg46EU/oTttVsZ48Ppm6hv5rlfQy5oFErP44ucIDLmjtdGQEA9
         Q8yg==
X-Forwarded-Encrypted: i=1; AHgh+RoghbYrOx24j18BNR+jTK42Hxsm/fXXxR3k1Lbl5OUb8RDPW+GNweJ7vN/jzB357eQbIaiyIEFjilo=@vger.kernel.org
X-Gm-Message-State: AFuF++mmEK+aFs3PxbtvjnmWDcPY/hjHOhw7cZbOqE43oICetO5/jBue
	9wjQRFEEcK09038euvf2mcNyRCxQ6AyFgEZMENUToGwXV7afsCgfttXA6iYvMCGeS31iebJ50Bc
	+f+q7paNW7rhFuqu0JJkMeA3pv+oZEUUwBJfAK0zbpBH2QMstDXu8pB1GTEbfOic=
X-Gm-Gg: AR+sD13lI0uUOkgbyVd/XyolqFHS1sRGRWNflBQFFqcZwH9H9bkDHHoBi4onqKP9n+l
	74ZbrwSmTbbtt48uAf1QrRVqtQ/R2NwwaaEWn5O5UD6B54KFv25678rpyXOeHiuIna8kZq0StnG
	LaTwBzL/1FxohAPAHeOGKOv1At3sBIrvjtGldkHjnekT6HghuKq2j2//MaTEMTE6kPkPxfkvlcY
	skZjNyHkiU+OvaYK7mSgJNFmtWSiiSYnfTzEKU4KGJag5Lzgw9VqabgLZRlJMmXtIUY4rUw3hT4
	OjT94E68VPMdJBW2hZYOGMe58ggAbg8J6x3EeoUR/aNIB9uovomfO2ZfewUbJctaze8djLL6V4F
	Lz3CkA0F3
X-Received: by 2002:a05:622a:1cc7:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52e09b9c641mr176201701cf.10.1787572617294;
        Mon, 24 Aug 2026 04:56:57 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc7:b0:51a:896c:9ab0 with SMTP id d75a77b69052e-52e09b9c641mr176201301cf.10.1787572616791;
        Mon, 24 Aug 2026 04:56:56 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249629563dsm1259990366b.17.2026.08.24.04.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 04:56:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:54:34 +0300
Subject: [PATCH v3 47/47] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-qcom-tie-cx-to-gcc-v3-47-f1205a92682b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kwoe9cDJHyiDxCz0G2t7XYacMKY7IbgYwFOuciWzpr8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqjDED75ng0aQajs3YEy9GbrRjxUSe2ufvz9Fax
 miHRFirMaaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaowxAwAKCRAbX0TJAJUV
 VlMeEAC8NASqNnvAoGy5djJtzHAVJuSHns/Rxrv7IOsAjO61QP7F5nJunT5UyW/1ilRIlxhDMir
 S0gP0/5VWwM3jlGeDnBuPctfyqV4klGCLWQquORTHLE2CcVvhRrK8iYeIG9zTUYvwR7edoPeAE7
 21UtN9kmXj9qkmQerdYsukVgT8qmKqCxNoz1Bn3GDji2C9Oij0C3B11xs86bqUmBnTxFQRMQZXd
 zaipwufxVRGLNN5hQOjUfhabcqGE6iqLkY6TFOpqVXc0R7zdMuCJdkreqajXFZ6oS7KXQrTpPct
 VBgT309C7juMQUUvBKLEg/kByeDAEiApsncZDxc/TK3quXSfDia6578lb7TB3V9xEUncGaG8/1g
 m3tFbLSkK5LKw1v65KOy1ESWM1E5UPkmjQdOix7chrlZUYapVDlMcNNwSvcQDsFFBQ4883qb5dn
 viZhJpDYYOyhVPXw6B6rnsdkwOAhyyIAi0tncnKEOIvW8/lA2AMGMfOWn3BTwID+cys4QsShOkc
 xykkbsNCNYg3M7jIQyDrCUNDhhZEo6XAKmhr4g8m9SW2bCRQY5KhXDsSUf7ZWnZBMdjeqPHlhor
 KyBHw6lyFsQ3f4tUaQT8i0NKQuLkIQBucHJ1V+aIDIvpekMYw8849CXhRhw0/8sr4b4Gs+W+UIz
 t5IIhfziMhfOpTQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX9OoXI9dMGeQn
 4YH3xA79TVhQdy+EG85nNlb7ea3qg+tuPm3HZxzEI4M5dZktxNGXX0gNlHpAuG2Wc0brxCiWHIx
 rJT0DVeRpGSrV7Yy4unrvxhhXhB6bCO7lCt898YujwNFot7CBPvW9zsPpBVPjP/w7M4pEZ6KPsS
 Gr/lhWR+uxW6U613OGsJ4g1StbIS0hQc5P4rda+US9i9CBpo91hhgR0eHKsgffsd3CG+JRSkLae
 RNxllu1pyto/Kbywj8WLUnLYgI8aEVIwTLc1786VeQtN/eehGnarf7wOTI3iy04tpu/eMphtJ2Y
 SS0tozBxy2Rfn7/c7VaWoa0EhwOT6VVLb1VfmIIljU5lm7sL80/V0LHcLtVqGNRp7GotlIqIb1Q
 mOjuQ1yScPhpG0j3G7bFTZ6R7GYhuSyBRBmFe5WvHjIIj1fa4upNAdULWlUnDxIJzz5E/cZNulZ
 J7JQjz8wgJR1+do73Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEwMCBTYWx0ZWRfX7Qyod9EFD76f
 Iyk5KtstqTR0xzoDMyiJPjqIQw8stTRUnDBLgIcOZFvgc0oESZBR2KtBrKCE4Plp0j83AaGhCaJ
 ZYWrW+ZIOuwiOIs/GbcDcbeX6CajgIU=
X-Proofpoint-GUID: jmZH-aoWSB_2LzMPaqV3YJrAmDGUKDBh
X-Authority-Analysis: v=2.4 cv=IL8yzAvG c=1 sm=1 tr=0 ts=6a8c318a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: jmZH-aoWSB_2LzMPaqV3YJrAmDGUKDBh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240100

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index eedfdce3c479..06ca54acf565 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -706,6 +706,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

