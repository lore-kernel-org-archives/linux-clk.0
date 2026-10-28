Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793181139;
	b=HXh7BNs9ZSUbM/ginXOJuOccfDgmFsB+A1g++/Fy4X9I1mUBzYoxpyVAifl2XkEIamLW
	 d4oJU8eDaFflvKl7qctFjwpdDlvPAl4VZ5kfCpuzQPKzug+7/5KzCWgdWf2D6xNPB1FSC
	 o/ooJScgx58DDnQ+rgCILFE2WUW3anBRUKJMawKY2uqbU+sdsy1ACooGxm15WTYEPZdHf
	 dTZrHnyF4MS1xryM0Ty6NR/F6GyJLcLbZig3+4aOpsbDQUdidAuWG3SBZo2qEo4zq/ucL
	 iZuLxKlRuuk7VfOrdsXNESa0KcYnJAsSrO2DFj66N7W/L3HtvwIQCq7j4gvd7Pai3zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=;
	b=mJ/FWybGGi3Ts7EVUCapnjYShFJ/WPlSn/dEuanmLhRJf9Brqu7kKc812fTV3dpNhSNA
	 zI6RxIczwa7qem3WOHTeLXKob3zjdia+HlvkN532nDDBxqqJv0rKbw10L95OGF6tsHhjI
	 r7K7pKRb7WRhLBQBWxKdiHvdcIsr6xNUplZu4Mw592Rqh+TeNdOXZ5N88mXNuGDgXd3mx
	 Q43//6067EgicctOe43UDHpDwESxKGLmtofr/F2iFDx8yTSuKs/OoKY7uUPSQ8KVaHoEE
	 iirNF+IeweyFEiLvoEYOOKxzPBX9zqd8Ty5RHZ0moNpSL3gEvdaWxg5d4WPt4Ogwr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYnKCxl3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V3Y/eSEE";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFE260A261A
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFE260A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iYnKCxl3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V3Y/eSEE
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K7Sb066114
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=; b=iYnKCxl389hSlbf3
	ou7eoEMjYZfzZ5J0nHEY6JWSONhYA7f50WICDCwNOY8VeH+STL/BYGlNVMfOzCgT
	YuYP71rVXWf0tQ8olTBXryWZYLETlxALwZNIADBxBaI4ndrRsC/PdIHg+iVZCv1r
	IqdUa3iKuyCqxHueODhKYCPo68tVwpa7Hpi0S5pLJOcpEzyCVKmGR0bn7v4JLKPX
	AkfvEpBej+8D+y0No+iWr6yDXL3YH9QtYTKpftiOoZQ2qeAnrvVjJW3i8aypMeN3
	lfOKb7PgzPCyidTQgWmwiv5tWMoKsYV/qiTLaqwmGyVFfkgr+eDEK7J2V9BtT5mZ
	omV00w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g3h4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 09:52:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ce7a85f04so143771085a.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2026 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793181137; x=1793785937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=;
        b=V3Y/eSEENw4WbODvZbH0zBK0HWwGOoVroWk8w3t0ZsEdcDmEYJCaxBl7AXlfO9ebyA
         rDNk/hTajo8uJkx+KYn46I3RQuK4KTXFDVm0lHpyNW+e1NZjeG0/X3JBbnf6HAsrVzYq
         t5FHQev2w3EDApBmAHUNvKlTFxZHGQha4ZSGNjSK9pOWfKnd2cGPSuoVRGiua3tRj8C4
         Bq4rU1VAS0+DfxBGcOk7Gh4ujeEwAh6Ww+mX4V6oofUS1SOQQLGyOJOFmorlS6tNhtVU
         ni06h2+3AbxhDZaoifKWdzAnTRT0wU9HPzieCx+OJusgAjJ0OgSMEVJrc1Znr3r2AvOb
         vlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181137; x=1793785937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXpG1iBEVpVTYiu0hZ6jjvnNRuCSIs+OV+48HEpQGyg=;
        b=d3AoZ6xuNBEmEeelsUoTaRphTRpC+LkcTVKvxLCm/Zx1TPGnGRRmtcaq13vic9eGAM
         B2Db1Fzblq6gzEMya4ToXD7Vn7Zti1Xo8iJpnOGsns6Cz3D6o9ZB4oYbhdkoqXeeFVfL
         zcRdjRj+s67i+mc3IfDeaMWP70oQdall3NtjjEjGaIMwsejomkdtI888iW/cpHr3XQ8T
         GiwRuKZoFi4wOcZFuXIieCyv/ZSX5dW4Q9rYQUb+ZGPTEkTvkMIj8YFTQ2uURXx0mTkj
         6lMaPxU+UHdB6wvgn3QXmmUkH6kX3Ov6qj4t1UVLluNPkxb/wjrD3XHCjK8R1cyGngsp
         2Asw==
X-Gm-Message-State: AFq9FYJ1mQsTPCXyMwtDU2Q0LCaiBqmlLcYrU64RFdhIPXSg6T7CYVt5
	t4cBgLY9l5R5GBbGrOpcj9SEKiYkcK+k1xIUElOM7xOYJTmyqCPyQIx/WNcBm8XzaZIGD1FlEqb
	xjGk0MJWWmlOI8shjW+O6OCJuBwXF0KxiZV/IJCpsJa0HfJHobNE5Py9VgjMbJjfV97QtTDo=
X-Gm-Gg: AYBFou0kfF9PtMWmMzngkRbbipK0gQwbtS+dgveBPIH7paOX3OV9POGSJUiRfwx5g4M
	2/MXkEatpUj9mwMGZujkjyUH18F0wSq2u3r8RO1JRdkPpXZ9CqJ4nCzTcdtX/jJcSaCB8BiOZFH
	Hrk+w6yeSQsiFMKuSw7FDWs041m3CyUW9ePhmu/ntIfITSpWqCgXp7M2bI9l/T4g7ub+v/CWcYg
	WJYeaAJYNbHYh7qtjGmQDQ14PsCfn8aTQ9DDAceveG+WnhVko0TrBLxn2I/yT2cqXHiz7B3vVRt
	cTJa16hC29IFTKgxaSoaQCXidr6gHkVSictRIZf8/Y0DQB83AtnGW7QqJSZGqTH+Oj3o4izHw8E
	3ZVLlhc8MEcLPcB33NileTtkKzFYukFFsBkK4fi2eNKvX/Gr73+qQWobxJ/o=
X-Received: by 2002:a05:620a:4725:b0:93e:c12c:f134 with SMTP id af79cd13be357-94408dfac1emr237026785a.79.1793181137094;
        Wed, 28 Oct 2026 02:52:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93e:c12c:f134 with SMTP id af79cd13be357-94408dfac1emr237024385a.79.1793181136561;
        Wed, 28 Oct 2026 02:52:16 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm27966715f8f.38.2026.10.28.02.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:52:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:52:06 +0200
Subject: [PATCH RFC 3/3] clk: qcom: dispcc-glymur: Restore the clocks after
 hibernation
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-b4-clk-restore-after-hibernation-v1-3-86cf62747a7f@oss.qualcomm.com>
References: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
In-Reply-To: <20261028-b4-clk-restore-after-hibernation-v1-0-86cf62747a7f@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=BSbzoilxnFmhYsVWYXBkZCbziFiTclz3oDp/brwicxk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq4cXJKhRD8pndPO5KmfIsQ0IH7c7LTfPNqqMNM
 6n/X8xwNoyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauHFyQAKCRAbX0TJAJUV
 VsCLEACrw+y13KUf/mgb1QYv+6HI5YRZSXsym+aMZxhDRhJMD8XpBVQg/Rz95HMefn+apbyhki1
 U9Vu697TJtJq36uj/qgYp7RkkzQQURfFgvhBvHNGauX/6XCTNYVfPpSYxuxqQWY6JnAKE6gfNWQ
 HvZwRufut5K+FrOrDA/88X9vCu3XjulYoqYXnGpZvGPsdDlch1Ry4vyOYVXsTv+YtVcaAhXgzwD
 uGEhTmWhaZLMh/jVmzzxgb7LgzDLt1Cw68FGr4EqUil8rCQ/Nk/SH3oDanCEEcAJOWU2kwXT3yw
 FWrtg77G13i3X6Ku5CzjBshOpk2HdN+CUnoHAWp5Uhhf8iUQkKEstUnhDiu6AkpZvxc+dAJM0uw
 DdUspoGNmbFUS7iMFFdmUWv8W4R4eXWjUM4zmV1QP/umMyPJGjVY9VybvAbcamKj8/Yz6/7tPru
 yhUNgKBftjMqmr+zBmUYnY+cxoP0ZYQzx6a4pDmKJqAqxwH9h2eRfC26XjmNtga/Xm3alclxyH6
 rA4Q6UDmJSbUEDNwrfZ0A4uQ/t5ZuAxAfyGC5YIhjXnrDNjJ62qbQ1/06vUizxe8nMWcXZxgRyQ
 khndtAP5T6uja+Ft1yxL/qmP/9uOTSLokEsrHUlUtGPCG4c48YDvReG4uVbKV5BXr7NqlaN4u8Z
 u7ZvImfkk6CMt8A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX0w6A0wgIa68H
 7LV4xC02NNhm8jfG/XkLdAYvP2ew58DMFbN0InTx2BrcoVFkXJcVF/T6co9pkV5tvxeNq82Axzr
 +xQN5YrIHhIJ7i9f4MuW1285el6IwmSLjUSRpHcf3JQOGodfVXscK0KZ7FlBtdcAJhHqKb+zAB9
 EDPwE8bjLLcqubdxTPGXyxugYhJTGwQUSQRBB5jKSIDAVPbLxBCkd/lLvXvZIwJ5W4nisrZSpUY
 V1IO8MjO/9mbCzSjuxgE1sAhvwulb/8/+756aUzAl8HbrtQro6rKXP9jkRVihylib6mDWItbmbF
 1TvryRBxs1sD/MeC9j9UOMqmyTYaBRHUKU2cATcUHxSlgrxtP6AysBILcQz1ymCFKwNyaJOjGZD
 sLxZEIPnPTmn4OUrco+XsehRBuEfcIdecV89Q+bWYYFvrKVgLDezt+MaKcYM3CJxPOEQMDWO6Dk
 csJCnUGaOVDDCzYSrYw==
X-Proofpoint-GUID: aSL494XFKfaQwC6xRfUibXPGPuJahp3Y
X-Proofpoint-ORIG-GUID: aSL494XFKfaQwC6xRfUibXPGPuJahp3Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOSBTYWx0ZWRfX8IvMUr8ZkzAE
 /3r297veHGQuZipVPIGtmMt/q8ni4hx+V+6P3RITjKB0ut32AqXBhL8uNk4giTWiyfda5Mbnyv8
 xlp9Cu/ivxEJI7FmA2/IyLyrUqmrcn4=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1c5d2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Q2havp_FWtokj3eB7a0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280039

The display clock controller driver is a module that the kernel loading
a hibernation image does not probe, so after the image is restored its
PLLs and RCGs still hold what the boot firmware configured, while the
display consumers believe their rates are set. Use the common restore
callback.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-glymur.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 32cc5226b4de..7ea51b8c8e64 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -6,6 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
@@ -1968,6 +1969,7 @@ static struct platform_driver disp_cc_glymur_driver = {
 	.driver = {
 		.name = "dispcc-glymur",
 		.of_match_table = disp_cc_glymur_match_table,
+		.pm = pm_sleep_ptr(&qcom_cc_pm_ops),
 	},
 };
 

-- 
2.54.0

