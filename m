Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795719604;
	b=E9Dkb4OwgcKbTJcmu/t5CCzL1E7MLUaYn9RW5U3NbBGOURyAzeBr6ELeWsWlHOIPxBMY
	 w0kpx0iV9/rjMm7f9IL6+F72SkustaNzs0Un3kesDuDbPM5Y5nxeC/dpWq09ii4lG+/kF
	 5jhUjZCTltSFlzl6XlZK7d7lGBWf1s8U+/G3sRi0+T5KJunI1fRplfKlxSaJ+9jM9izfE
	 3i6PHt49s7sDbI9TqM2hM5TP5J6OZoh/yPGgmu+DFSrgiVACgmtCzCRZQF1yjLsWuSZO+
	 wmlEcLHbx8x5A4eAmxdEvrmuEmKNiPol6DF9jRMk74a54p9S/jkd06vaQ+3B+Y933GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795719604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=;
	b=UMSday+XnxzJqwADs0ICpR6ZICi8Cc35gWSViql6b6ld0aKlECNxdDonG5vzxcdmIe3w
	 qfzIsUoYbNG1gd04mZVyFvFatSOMGl5XAzRkawH2375JaowG0lUctnX4kbvHGimn0/6A3
	 2tOY2oWL/lb5I3n+5Nt48fKUym4zs1leN8FOoXvYo3Zu6VFKjkm7nwbTYEBvyZ1ohYjHT
	 DTRQVwwx2WOsdb/jXg4bvZZaCC6g0cs90wM52B0JoH1KWutvW5iVQyYhAaW40MMK7iUvo
	 030Cqkmuc/9aCwyI3dlHdH00uOvA7Qjai9vVZEdsIIA8kiMGJD1tOfdR/Z/2ZpghqIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTCW4Tav;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qk+4cFwB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6A2606A329
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F6A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PTCW4Tav;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Qk+4cFwB
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu8J83484224
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=; b=PTCW4Tavs8sEGIGD
	sz8/fOge8yOQMouJw4pYBniAonjpd3qi1v40dZYuOZsWJDzyNco7HZjpzaTemJGB
	lfyX9S15RhwnPg0fUXshot5FEWJ3byCuw1fItJyIVgWbqjeC0gSevY6mTBrg+Xb7
	shXxmBvYar5xERAy+pUrE1hjJ6zJOl9JvvjTf9leLKLRDm+TKW4iFCcbdFy9tZDz
	4FshGmPhoCGlot+2Ps5Cq3gJ6lID+4jnHm1DFq3LwROaYunKW0hqRYfPMhznD0PF
	Z7ASnAYCXpmzd+MxqnEWJbJduT0y7YbG9fSFeEi/XXgR3foa3FPt3ddcUr92mFOW
	IxA9hw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak03gcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 19:00:02 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b592e9841bso1629108c88.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 11:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795719601; x=1796324401; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=;
        b=Qk+4cFwBGGKT1PHEUp7Ej2lcsLlXezJhA/E4hd7A0b5Fpm6gHthacNuw6PC8+R0aaa
         8LCiMylzZQAJkxDPxiEOQY7Ih/awYn1qsulkkvgW6/0QX3FJnI9AoA6bmlRDMtTiCJN0
         UrhCl+85p4JsM7VJbRqIZWr+o454gyOsSWjb45qcp9V4WeBvt8YgGDzz1SSgl5XBEr9R
         7dZ66kaiFVJj1fOfFezkUVJe7loI/c5SMvp26CWCqyYWBaMNfJg9nMB5be9OdPM+Pfvr
         OV2VdFh2cTKzp8dnCBwA8EkCHcGvGV9AS66MLnAW30G95o+EBapgnlJ5fJh+0WLa/Wog
         Hz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795719601; x=1796324401;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NII0+L88Wv3q4wyUgO6D17Ai3ObjNTZatzOLfgRo1vg=;
        b=Ipsjr9kxenfUd9j55nnS3HrljuwZXZAzqn2B/w3KcW9ycJLl4sfPSxoWq5Y0ZM72Jf
         h4D+v4064zxKx2ueosrUFurjJKvAvek4i6eN+TbNvQX28aCUB2BstVVlMvS168zCf1Z8
         r4+6e5C0c8IYqztX1fB+UPnp+01PXXexo8+rCJh8rCKbCJOeMttbkjGBpnA/hjx5SF/7
         6X9LfNUduTfpIY9gURogLMLLVPvnXPqgwz6p6EdiiBqsdbN3UCKoWCZ5orCvEufgecdh
         ahWZZZ5RUHO84nt5/R5nuRcYjHC1ghbJQMDImaXVVS134Xjuhrgodst19Oul1QZGBNtM
         znQQ==
X-Forwarded-Encrypted: i=1; AL+hErGXAXFRkQcKjwlFE37RO5fouLEUETEoyQih4g3pIw0armsq0zksNoQL4aLDpuk718T2hNruHHxK+zc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MNNT5xaraSZ0CFvDhyHQKtANH2OrtCvYLLv8aln2qemzAy2B9
	NqUi+nTx25PoefnqBt6Is6RDm44w15/80UOoOwH9odIsaKJgFBz6yoBqptnWn/FSefcGVT9Oduf
	HhqO64DIIdSJMyODe+NP2u7E4vR0/4UftGOXecGWyqSR8CJul5cgizcijRWBm3t8=
X-Gm-Gg: AZFdTZeOPeZ5OT5kDdvXPYNsnNdltmwQJ3s27tFIVn5HmsIMP/AzALoWse0o3Re4YqR
	l174DM/NeuhTW4bbafduUDe1/6GlAgaBhwm9OD8vKCcJ1IjJA1dUihOSWGGWSGBFFR3AsVY7X5M
	HVDF1stP4w7bjB6GjItBcpqZ07MfHxnLeF4Dv1G2nI/F4b1RneT2nYGH2KVwV89NPcrEsbAP1Gt
	i/eaeJytcRKqa1plZrqclOfWdwQzFdjT6/bsfLVmzemWU39wwDneoZuJ9XR4TFXbJ73xhnCcFgV
	PHuqCR0hff9zzjHYE8o48TQp0to8+qDe1Rjfr7tIhtW+jg76Ha4Iiz4QVqFOc2gBfFKxxlvhICV
	hPe4gL/HUDFXp6HFB3nZzdsnuxVE3to/Bmm4vLLSLXrURn1dDFYP0Tf8NtCxY2Tn3NnqjpsJMlK
	7PWT4Y
X-Received: by 2002:a05:7022:1701:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b55feaa6a4mr19781261c88.15.1795719601448;
        Thu, 26 Nov 2026 11:00:01 -0800 (PST)
X-Received: by 2002:a05:7022:1701:b0:1a4:c892:b130 with SMTP id a92af1059eb24-1b55feaa6a4mr19781239c88.15.1795719600868;
        Thu, 26 Nov 2026 11:00:00 -0800 (PST)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm60868190c88.7.2026.11.26.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:00:00 -0800 (PST)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:27:11 +0530
Subject: [PATCH 3/8] clk: qcom: gcc-qcs615: Register set_hwmode_dev
 callback for USB, PCIe GDSCs
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
Message-Id: <20261127-usb-pcie-gdsc-suspend-v1-3-485a08ffdc6f@oss.qualcomm.com>
References: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
In-Reply-To: <20261127-usb-pcie-gdsc-suspend-v1-0-485a08ffdc6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-pci@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b0881b2 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zroWNzDgHOBiqxzc7EQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: is8TlAc5CiU83hskzf068ZiVvq66sapd
X-Proofpoint-GUID: is8TlAc5CiU83hskzf068ZiVvq66sapd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX5qmKhhKW0VCb
 ae9puwk0nP9ajEIrHXQOGsjfca83d7HNSdKBdUt4Syoz0aKzTnKYKeH658A4WB8zViAXCvDo0nc
 +5/77j7ZuyWRuqbcu1/7L+xqe2opZjtB7xxLsiZYn7YEm3n1pePW9zaEa3tNKAMt2Wbcr+ZCwJ+
 QbLeHxhCHX11LD3y8FP5A+tkbpoYOfm2AI53EcplrC3mQ72oeCMuzvkeW0cFf1yhMQiQhan35HX
 NK3fki0JM5DhPU6xXsDDzf5Ye2wlFuNh2f4fdAABMzPpXfVx342jVCyz4AeS/f/PEwzM7aRbQCS
 kVXHpxHOYo7pi0A3p2cQsaL8UJk4gN9VP14RAqOqfydlsklH+2PZ7f6URhg9KrqxcUqAjKKNbf2
 1dXRKV0qTdIgs7ou8GBNqylO7HDZB0LyCvELfJNi4vuaRS7bOdh0mBpHxTah5dQN8u2655ypzrA
 8G1wTcjo1HxdtpF0sIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NCBTYWx0ZWRfX9/J9OvK/8mWa
 DnCQWtl2jwcgPavYDjJjTKTngKIsmzEZhL4kU4mfNocIwceT338lA04TVNWI96U+BB6wRpgXa4+
 feQL0j67SlMO7fUrTR2caiRXi544HY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260074

Register gdsc_set_hw_stay_on as set_hwmode_dev callback for USB & PCIe
GDSCs to allow the USB & PCIe consumer drivers to keep the GDSC ON based on
the requirement in USB host mode and PCIe non-D3 cold usecases.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcs615.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index f205de3a936170413b21173c7af9668c14495369..76d835346632ed672e0cfd896723b84c185de270 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2654,6 +2654,7 @@ static struct gdsc pcie_0_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "pcie_0_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };
@@ -2676,6 +2677,7 @@ static struct gdsc usb20_sec_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "usb20_sec_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };
@@ -2687,6 +2689,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.clk_dis_wait_val = 0x2,
 	.pd = {
 		.name = "usb30_prim_gdsc",
+		.set_hwmode_dev = gdsc_set_hw_stay_on,
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 };

-- 
2.56.0

