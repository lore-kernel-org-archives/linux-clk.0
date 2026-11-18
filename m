Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987938;
	b=hCYttyLePyyRun1yqD5h75K6U9NqVUxvUpsSX+yDdCJa3pYp8nfc1etH1R3DrcI+nB6+
	 SX9ixbdh8A0aBdoNP8deKdX/7b7AzlEPFV4JO4fybN9P/KWkiM9BmzNShAt3b1TLTxjAN
	 Jh1ALtvzzB1S4DYoFJWb/E/zQAMyrGB9rJSsYAu+X34N0Juk9LUnwOuErpKKcdbOVeIOK
	 VTW96UOMV9XhZpvd2m0LpecGP25Ci7cgoohrezmmZ6dEPYMnvkdZh8AdskkrC1SFEM4h1
	 SEHcLzhuDfJ2VdeSTPfbZwnp0src7b4hT4fnLkM1WgQo+2IsSlUxoil8OR+CiIu5ACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
	b=G8UnBu1o22I89ehLvxe9UDwm34+PPMUU94tZnYmw4xfwNf2T/PIJkAATEgZqfxaP0/9e
	 88qxMcZMKUXV6/XWdgEi+fvbr0RmtBFqhi2bfjHUR4wfZ20jGCTYKzwpiIhBreESKU2PT
	 OrvKZtkLXukArxDkCS81VLyf7H0KTb5IQ9JIyjGSrt4nFcYe8XOQ9Qa+LvpoV+Io9I4xZ
	 47yXOEadQI06bQdLp9Z/ggl8rao8uuEyEfboQOHDSYK2utLK7dOWQyhmwIbN8XRxk4Zcw
	 pKYii+0kcY5BVmmvRyiywAHrq+N4AhGbZs6JnNBCE8lpG9l1mktPww8EMhI7mydtiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m7u9OEVa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjXSGmql;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9634606A32F
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9634606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m7u9OEVa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cjXSGmql
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V3px2106389
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=; b=m7u9OEVaEHvpKVMI
	XPcEemS9a45Y1pYdG4OVtwfgYrCUQeZ3BRM4hSUwzvVHhqbQ8YP5WnWOmLa8U7AL
	nQ51C0CTkyNskPlQ4LZO6vSrAqYgFTPu/1RLfyDWjhqg2JIJVzr2ZxQMLS50RydQ
	K+Lnr50mTUCXWC92Y0yx2/sXvOWffNyGxfM59m29wLhpVV8aM1PM5oVkvIOJsO/R
	k3DsRFqttDUo5POxpIcszaKg8ld6jKr3blqSeKD+gW6X1Bf3rrZqEvKMRMW8pjO6
	98M7hvfGOalWf3cSZxlAuch4OB+n2L3GdMKPIuK24VzoJ2k29vyc5h99XfhuBgaz
	KG+1nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8stnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 07:45:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94607500fb0so110935585a.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2026 23:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987936; x=1795592736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
        b=cjXSGmql/qcW79pYdyxrLTRkjhADG5D71DAJe8L3sob7epFxt2tzx+BaJKjb0tGBUK
         XKz0PnzbAH3hjP5+a1ceMela6PCh5vYXqa2QUzwse1bRUi13i9mK0UaO84FqiyRw3atU
         OONij1nr8YKfi47Lk+Kb83Uwzp9a7u8cwvu6WwC+6yAbo347YzydCdeY9g6lWr58nfx9
         dm8LW6JrnJxlNeYI1BUpJY3JOT5xX4BZS6FBY7NDZ+9YgNilH/KVvilgR/jZTwLddH5l
         BHNRDJclHjZJAIgSLKoAu/RTFHff7/RkM7a0S//HtmA1c0dQeZlPDXVESTPu3MNqmxeU
         BoMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987936; x=1795592736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXJTyC9DJ41IUOx6k9+mNGczBOiPcutOoz7ayN1rX7g=;
        b=hSZF+K0Jz6NWHD/pUV2HcMSHGfgVoH6oF4SKsxyw4+/nWh4icyfCdpOqpQDJk4X970
         j72GbXapNbM60sI7o3TvL/dspQfQaQ2JJcPMwuxrTWi2CK8DgbhESVDFRad5dR5OKcaE
         IZozfDSqmBF3mii5kkQNxVDzt64fWDwpDRWq2F5hwlelRXNGlt+h8HZ3vm/Z4dZ3T93x
         WBtK19LdMnBguSO0PbxpyeC2N8QMbQgudrKEWYf/5KlcWAbH4zdz4qtr+1lv0GazbLGf
         zkgIOFOE4yrPotHqsDzZXjUPDGKrx0idUibKa0yKiWVhJNTLFPIOhLhABbJYPdxwV0z7
         FQdg==
X-Forwarded-Encrypted: i=1; AL+hErEvnG0qS3uu+Wugx1Gq3D+Cp6SAxON44aLNhat3JYocZMnrhrMjibIAFP7Vk1LUeBxFgrafS5jjqBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/614tu68iWoG0Gc4QIfnrGrjOiWD367jI1fNbwZmobyTpL1oQk
	2s3Mfte2kz5cU/9QZUC1Tpo82GxnLwgDX+Ab6ZL9ytcn/n2RPSusqsFTLL6uJYhzN2AdOJIsnOF
	vat6rBy2DbxwU+r1TPyCDHio9km8CSQ5qa/CNcm5dMTtX1E8tUtSytzSM00GSqJq5SkRs7gy/CQ
	==
X-Gm-Gg: AYBFou3JEMkbB1gMlZwkOFEpPKFlM0PXKcmzBa51nGdviX2BO5nSpRM5GrPSazOg6nT
	dl7OL1UTdPGFSGa7UDvBbiAlmf4iMJAH5LDto+l70FxKKXxF34aMenvlShLo2zUeizao4j5woo9
	161ho9iG0yasC3YbZchVE8gSluO57A5LgT4xVP54FPkgVczuMHvRz9f9Udnoy5Eik84kUU/ua8K
	HuFsSltBT7/9X44h1AxVTo0D/2XEDd6Ss509U3OsttpfdFDqYvnzgR1fJpDkckx+ObehcBXq5Ns
	f9UcUFb7atpjaYLNuqGqcjuF6o+83IabQtjDCRN9ZfCgll6rSJxZvVuMKRBkPLO8MlJaD7Ud4gX
	0C1Isnj6CQ2bjAuD+uu1AlYsd+vuvn10oAftQGlqHaLUZk6ZeyBsiT2HspsLiP1iMJJ2w99wzub
	i3dKWBRxdyVgOMqQdangXVQ09rydvQTaLjZsoGJn1K
X-Received: by 2002:a05:620a:6f0a:b0:949:52b7:468a with SMTP id af79cd13be357-949995d97e1mr344429785a.51.1794987935937;
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:949:52b7:468a with SMTP id af79cd13be357-949995d97e1mr344427085a.51.1794987935506;
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:35 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 15:45:08 +0800
Subject: [PATCH 4/4] arm64: dts: qcom: eliza: Add interconnects to camcc
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
Message-Id: <20261118-camcc-fix-v1-4-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
In-Reply-To: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=930;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=hw0zxzf/1xzDeDl5Y3u8agRf1bz2PCqEVVqN89mjp8I=;
 b=Vq9K6QS+4F4RQocn46+6qHVdmQoeEuNmJZ1dCLRorBtYBo5+xHLGXySyGOHmZS37U4Po4gr3F
 uOqhtSC73piBQ+RpYFcPAinAWj49gyetLHHRk60l1nshhjGaUF2tgJ/
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: dYMgpYWbo_2AYzWD8xeZjjiIA4dX1e3h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfXzikbfUBE2yeN
 K3b0zW/r9M7juH8fVlIgv935Wa222mdyZhRHZQdaXp3UcnzqfCj4eCIrFTZ2VgwXXUHwfbOWVFo
 D+tSJNZxEJj7DZRO50OVHo4YAMXg8b0=
X-Proofpoint-GUID: dYMgpYWbo_2AYzWD8xeZjjiIA4dX1e3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX47NsIdGVi3w4
 ZCMIrcm97UnIzAQEl5Po3754GZmqx/8kvYax4mvGImZAJbiTcqNNmA9UYrPEhhklANEm9HRB+n3
 8xLZWnezWVFa2KJ3Is77O7Hm0Azyb3qEiznejypvovHSrA3u1aQeNpoIh1lfnKCuPjF+mhqdhZn
 Ko/mX0Fe855ggt/PanOnrmyeVGyM5M4Imv1PoI+MzX1pBwR3sWjDSv4u2mtqWMH7OR+CsEg/WTq
 /T4ReiUe6kfX0iihT8C5luDTOw0t9v3c7cJ5kf0Azs0sPBzpB7+eGeBeiWpRnGTxxfCVQNgOgjo
 rRVTBoGi2CZ7zSckkb7dJRIQ9Po6Fm9sli6cZhnqCmo/2pNKU5f0aUbMwsm+ZdBr+DLRcPBAwD+
 RpgBo4YjmITg6pCDc4dz1agoaRURGnAJ0/Jf+SvNEIGhhzIS3BWbied29ApKq5d/tnvDGuXNitM
 v4M0jonnQCQ8LTsDnSw==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd57a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uBU3Tko-eBge3TvO44AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

Add the interconnect path for the camera clock controller, which is
needed to keep MMNOC voted for while the TITAN_TOP GDSC is on.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a125ef386c025fe6ecdbf4d17a785d1532ba09e..9d0eacadee3fe72283219b630db751f27f61897c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3456,6 +3456,9 @@ camcc: clock-controller@ade0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			power-domains = <&rpmhpd RPMHPD_CX>,
 					<&rpmhpd RPMHPD_MX>;
 			required-opps = <&rpmhpd_opp_low_svs>,

-- 
2.34.1

