Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893254968F0
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390220; cv=none; b=BX6eNu0rhLG5K/HwviSTKd07stEuWr6km87aT9bbvWea7ut/m9+61S/ZXEjLsJzMX1yJmSvto2G0wexGwki6D4JjgmEs78XPMIFwDfJOond5ywQKO8Q9Ld7aszW5GLlq3g2wLbiJBtLfE5GaiRGPvJ0NIsg9t4/0fVInjBg4MVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390220; c=relaxed/simple;
	bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RzwOEQ9LvJlbycuf9jaz2P6NK0tKiZmYcibNftsSav7IHgtFWDMQUkEFtKL0gmsRElS5+JBYxsQsNyT0p/NncoCv+krlfPIO81DY8jP57YxUFi3BLakongdpwj7pOxRMthzCmOJhd8+Ld5JlKM5VRVGH/LtHw5M4zCk/t3HQ4HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pmkpajkD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akSWUggI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pmkpajkD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akSWUggI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlvlC3860362
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=; b=pmkpajkDi4WGDb8q
	Jhohj62IJvtISjtbm/Z1cpKc0D0PQj0cZa4YS6pvWJNHyVodHWfPKdehSTqduJ71
	FomyvWmQPN1OqhKfB/5/RSH8aPu5nYlx/LNfxQXhmd4CBKPWI9+jXXY8BoW6cK+R
	C6zebb4/uo07F3V/CIEJp0uhSn3Q8/HFfH3zHeb3VxRvmtM6u+Kaz0Ivltkq2NzE
	6e/abVJgo8Qk5A/riASYUBJ/A1tLD4u+CGHh56myHz6D3DL/ENBOU/LLrxUmqz+i
	EX7mlia+ecyBNc88CqielOb9sQxX5HnfOhjPRWHyxAdtA+SAdcL53oCRvxo/1rh3
	7tF33Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f11kc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 12:50:16 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78580a6b2fbso1030805137.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390215; x=1789995015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=akSWUggIBlB/A4AHax3y2peYJHeDuNitYqB+s09+dBVB3xkG3hIeupy5xUcZr2PRjf
         n1ZTxkrfyaxulr9cIhBBTvxWOh/faTkTQC0C9Qx5vkY1XRbr55oaa3nUXz2hVHzVO9of
         qGq3OLnhRpYuHJYKV0KgRveEgaWb4nQ8TP6KEOI20oJYM8KDq8x5EufyUQ9SbfwyYFVm
         ZCDHS0mTiEF0GHlH6Afa/gIYpmAdWEGjmBE4Q1rhB9+X4dtcT4ZlhExwDK/VP0IpJ9Mb
         UJRRUS03Swp1zEl/ZVQgjcpfttW4P0MLHPxaGM/U+yJexYJj0AjKNkzReLOHJdLeWjO6
         XUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390215; x=1789995015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/1+N15GHXDbkN+QPbbGsdK4ea7My6Fg6Hl6am/QVbMY=;
        b=rZsJEOjqxgybHFQw6qS4qnCOOBN8dVRUW310tFqO7QB41e+btt8hYtvtGHR6mQCK0+
         VxNu8/U6SXJZYMf87YkOpKUVeNVzEodpKBxdQT1tfgoDPxgzY8JW8pHHYmxvV8jyikBw
         S/Au6wkGW2aObm+sfvKZ2JY30XU8j5qQ7XEyJiK/ClZ5ivUkPoj+iSpIPePZ97lQS5WC
         mmHPtx/dX0AxkmuHFVpQM6UrJclnxxP305f3B0Cx4YbFWA0DvvOWSYrRWda3IA1OJOH7
         GzKrn6MF5lCJzT3RclGgKWukEfjOUdBj9l2ha3MVnAaLyQO85uiFdMJAqP9MpvijXDgp
         MDRg==
X-Forwarded-Encrypted: i=1; AKwUvBz6QSHi642O4jHTlgGID9FH4Tw/Gs3DsOGtTZ5PsX77Plq2uylsArvEpxZO1D19umnBnhIwWeIXYuE=@vger.kernel.org
X-Gm-Message-State: AFuF++mZQZjukNeFDvdmtqQEGg6oiAL4O0Cy48+Fl90PF93E0Jxr7jyX
	JylXSBIDhiV5DLHdh/UAwCW2BzsnKxxXzi+fVfvTzrpPpTupUUmkQyn8wFaPzqTjACmsymckWWx
	0kRlCqGHMotWrFVA5xy6vrY69nThqPNE3M2HZdd0K0fgz6ZHY35mASSFmC9JY5Z0=
X-Gm-Gg: AYBFou0CS65Ar5C6Uicwrxwlrf51wunXqduGQ3plScgbmoV0BbK5FbdIb4tF6aSe9Ss
	dHE71LzNmE8TAZAnSMiExCpNRbwKOB/Q6sXsWU7wzmkuQKtvgszrCknQ47Z/B1ixmkD8AC6GHoH
	/1O5smxfHs5UhkuoGhvxB4FP4EZTil/+JWpjrmzczsTd82wLbpXfzlbC6GcMyRStcVbAea08RVa
	qcrZmipRCrVlSjNPV9zc3af5tbUlv0Ep/322/CtKdsRVGiSAQgYXU9VqRaf7l+CrkiUqwYdQcLW
	kocQMZ6vV39yFvYU1NTP//NEUzJaK/Pu7X08P+KHk8dHe1Koj12LrqAYaHRLS9/udn0/31U8HJ2
	VWENI6tyR
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr1433741137.4.1789390215405;
        Mon, 14 Sep 2026 05:50:15 -0700 (PDT)
X-Received: by 2002:a05:6102:80a5:b0:795:87ac:9cc2 with SMTP id ada2fe7eead31-79b58d7558fmr1433710137.4.1789390214855;
        Mon, 14 Sep 2026 05:50:14 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:13 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:49 +0300
Subject: [PATCH v4 50/52] arm64: dts: qcom: sm8650: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-50-9d5a606ada33@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhtnRp9S+i0a7RDUpetDnrE4Fy6EZyBsZ7qeXAQQRiQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z8mK/oWSEVpRJwgU0xbo0T38BnOn+vWKHsb
 YJzITytGoGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/AAKCRAbX0TJAJUV
 Vq82D/sGnPkn33GHFFej/nprGeJVi2SFMJoCvR330SzAdyXLy1b2zg+6DU9CYwbtgm1yn4EkAR9
 i6B4Lw1XRa0D3o7AOSbh1WTcZWvoqEU4e6Ehl8DRy/iJVlvShznKHhL76QDowOXrF9WjHxXvkUc
 lO2MaH8ONXIQBon4g0NgknZ1FzLgBHnxD632dsU+A+dJ5gdgrGrLYRJyBdJLbTKsV/M9Fqy96nD
 fDaQXwsj4Ws+BC1kcZiUYZ4tkryHZQZ7vpqRjOMP2f7/llsgoIEU4ZdGpwcE9W5w5GALAv+Uz2k
 SNThHeghJ5+MCdY2saQrdBngG9QkUuUANkxsGA+vg+xI9U1+4hNNJGt8wWnmncSMHXMViW4rhCs
 x6yPERM8sytE3x9E2ckB4+BZQ46Y5L/4qfl2QwdJxuY4HTl7JvTtzOj+Ol7wrt6Fc72H9AhT1JD
 Sp5K1esqCgp1nuEFxzE9pct1DIqHRFmzc8OyrMY27Q3UzRZTYaRPLA5gE6awtyuYChpdplKOB4j
 kIpYEV0Se9ABMjq/tzlJ2sD+E1J21abZpBOnkStknU8qKxBmIyVASVZFvACdU8JA2+QMVpKX3WO
 AQswQE7c8HPtJ0jEmm2deExLf69+DTdTWCt29/DQWDuHEvZwV8Q+ywFJsoCeXMHcXaYoFxVjyDF
 khkXhEZsSvf6utg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: u50LOcNqKrQd_f41pm1kVTJ6A4UKViF8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX58Kplmcl6mF6
 hZwgw7Xj8vJsdJrBTxFyw8Bh8Hdhc1+VK/mz5i9gG5+VLz3/R1cdMOKu8agyjOFBkifDODSBtEU
 EhkbVOqQ0liJcB2wsmb7TsEVCq7bunE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX0FO/KCRMWE7D
 qp6GMc51mm6QGS2bcXkGX3Xjd4nAye2b6KlgVtr93MnITTzsMCRlsNQHVlQB2sbIHjN+KpHqCj5
 wHk0IOFoFnwKqAMqa3qGGKf7lmBgptS/567hcmykOIvAQo/aKTCQdO+F3pg0d3yL3A6iNypb7NE
 v8S21c2QK6mm/PLUXnFVlfytDufwCnfUZvxk00YKSWSMj8TsJSnW22WoNAcXPu5upJ5iK7YPAdQ
 1M44n1TulIV6UrIoW6RAQOn8ncwhoF2jPDYWkljwoz1n3AfI30ORndHvHzl+LCsi3V7akcM29oW
 7w0YAo54WzUDzlH7T267+aIMPEyFk1RpECv8GWtByqrzndXp5jIWIlqVCl3RHQL+F1Odt/Iy4FA
 Ym/nj/h6Nge55vBwvNTsbJEosUztdoJJd7K6CqTMsOukRF5MfvFCnG1v/c0G2zACyZHSPX51hrO
 fWg4CagPiqGr4+Kc2Vw==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7ed88 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: u50LOcNqKrQd_f41pm1kVTJ6A4UKViF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

The GCC GDSCs on SM8650 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..9cf38a7e0b94 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -2018,6 +2018,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

