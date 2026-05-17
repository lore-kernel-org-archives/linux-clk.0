Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280CB31A065
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 05:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997501; cv=none; b=kNn7ZGuyDRPCNfZvbvodC1rnK3n35LIZr1BcfiD97p1NhiBVXd3au+s8Vp5S/RM+zTH94RgFoiwLXubD1AnaZ5Zfag3/TO1+JfYbq8exVC9ZTdDhe5OFaAPzMnSigeNRhMzgkaxvyi/XR5rdacnZIw3ADP8eMEvyrxFQXknoVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997501; c=relaxed/simple;
	bh=4597JBeg6kgfnQszJiOzy6dfc1VeQ61JX8ZL0rIsTg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuC248dt5koAUpTJ6623cVvkLk/qXzfx1U8P/yRgtbUwswQYFVivMfBK93NNmojX2i6nIndpv2x2OUYRaupJjgJ+kKmM20VBurix4srmiEM+wP/nJ3xhtkY+msJJnzOVBt/4ZdiZTo4kECleGgrLxSQxrEPJr3eNlPGFCZ1tMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFC/N99w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYVGY73z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFC/N99w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYVGY73z"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H38PkX2303883
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 05:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+9BwwnwVojxWCM+krwWXzCEuSIF4Qq5tfJRzINQD7s=; b=VFC/N99wKIDpnzIY
	P/PQPxaC91lm/Ch1XyBK1mIozNh4Soj50eYY5xmbtmkXfwMa8P6Emb6zmUNnFCPF
	rebg06IECnc7bexPuPmTKQjvgxrDvl0S8scrrB96WZfZchNMTpLMDDvZEEx38r1Q
	yVxBMurtqd7iBP3/L/oxL6ygjbMiAFpu15KE7e0CW5LmnC9RKH6qCrmb/sTT+QD7
	fKWHA1EKI2W453OL/RHQRVUNSBHVHS+gd3w2oqCjJrPnX4Nt8xaAnyJWSuH0tstm
	j1x7PNEvhKE+x+B18wE0C3QpaOmAGg2FJbZYGEFIFFIX87IPA9eKyIVKbuFXHhHP
	E7cINA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqtaay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sun, 17 May 2026 05:58:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so1663165eec.1
        for <linux-clk@vger.kernel.org>; Sat, 16 May 2026 22:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778997498; x=1779602298; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+9BwwnwVojxWCM+krwWXzCEuSIF4Qq5tfJRzINQD7s=;
        b=HYVGY73zKFUeQyOPj2mdRpLjTNsy0teVWA0obYU4jegjlxih04uv5HASWEqD0fd85W
         i78A+287eIL1wqXyPVNP36ZNNy+tABxw2AF6UQCRyWhnc5UqkXL5+VfyPxo5gAKmRCor
         bT1O7mXQnO+SZBqIQWtOMkDjkLkXC0Cu4xy9fKmlixCyGogjYngvVfTxslUbxNVVbv1n
         L+8+zSBGwyA2sx8/9aLzQLtM6MPbSOhtQga1eCoBTFmpXNqCYjlMeRHsQQPPnBwjHnvW
         u9bDRkaRgR8RsF3jaBXZROPwqrWpHY/32jw7a0u0XTp7aEOM1eVesJH3tZnCBMAhU2d7
         RWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997498; x=1779602298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+9BwwnwVojxWCM+krwWXzCEuSIF4Qq5tfJRzINQD7s=;
        b=R7QfsPHSsQ+csaJtv5DA+TR4p+YTsA2gEFiKMwW9aJFF7KR9SS1HGBm0u1nV7brfY2
         mZdO+2WxzfkzVScRRSGA1qqCWVP9pVGIx5Ttn+Aap3j+l6HwQ5Npj4dHbK2zDSVSUJOi
         677vkEl9EhxFptNoX74RTF+GAgK2w0dHeMe+Dv8VzUmMdN4lGwQN0YfRDvKsmFPw29X7
         XBRAsgQPkKTp2G4lDJuwKu8QznlGX/rJFkSJiZ4VGxU318R4e6uZpb8VQ5A/VNDiUfn0
         AUtyJ1wBXltEQSB3FyjV4E1mu7Y0mrCXIwr1QCdx9AbCetvelA7xOmC8Fb7rAM1IWosE
         gadw==
X-Forwarded-Encrypted: i=1; AFNElJ83tUh9cC3O8ADoLIMGwarrsPt28Aqa5PyeHWA3QxqozHepDPMCbmnrnQKSdyNDk4V1vu9HPV6pXAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxv0V/x9bkUcqp5AZIyhkCPeGY/7IVP3c1hSjKIal43tg9dwq3
	UY4fZOlP3CCA3FEfECcnTvxetH0UTDxI9dgQtTiuyU0q0/fP1fAj/o2R3FmqP7uxzP6dAJ4xLC5
	bm2K2BWGv0CgcoWzK4nOnywLzr7tWa0x7pk0uwegwclY8yOjPCnjLwCroo5iReYo=
X-Gm-Gg: Acq92OFhjemU2K28uRXdTJUct+Y9safIRCD5dlR54EZL0neSjCqaAsbr32W9KS06Th5
	ErfvEXv7yVaoGZOGBI6yfXFl+BjP7uHHLI4torHSMvNGlVv6kimNvqfMSjw3oZpnbchL2KFEPaM
	td1ICNhWR5MMWsMbgYwT1NIieAThJs/HMV/s4ukKYY0J5akLEMHUFvgod0swS5LEXIHSPJZX6hE
	5cupQ3fxv7lP2DMHRzHX7pXEdQ0hNypmh8hvwUuieqPmCjODr22iYVPyPiFHA1E67jnm6p1wdSA
	G62NsUsefz2p/EJoKJv94vaMLxMcXhD4IXrrH8bTQFDv0xWbjCkkVUWxsKcND/WaayP+gLZOy19
	kYIgYcNWNkLX5ndaiKyFdi/6F+Ibz/hF2lQfMeZ+GINm5sy4BdcEA1IfyMVxJLL0yE8kv
X-Received: by 2002:a05:7300:fd8a:b0:2c1:7afc:df06 with SMTP id 5a478bee46e88-3039816dcc2mr4998297eec.5.1778997497989;
        Sat, 16 May 2026 22:58:17 -0700 (PDT)
X-Received: by 2002:a05:7300:fd8a:b0:2c1:7afc:df06 with SMTP id 5a478bee46e88-3039816dcc2mr4998289eec.5.1778997497423;
        Sat, 16 May 2026 22:58:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm12422240eec.15.2026.05.16.22.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 22:58:16 -0700 (PDT)
Date: Sat, 16 May 2026 22:58:14 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <aglY9of/4714us2o@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
X-Proofpoint-GUID: hhkLr1OKwbRqS1N8oRjbAv_hYdiQMf1p
X-Proofpoint-ORIG-GUID: hhkLr1OKwbRqS1N8oRjbAv_hYdiQMf1p
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0958fa cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iUXL32Dinvhp5_9vHWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA2MCBTYWx0ZWRfX0HZmw3lc5d06
 K5m7Q671fqRO/u+gMfkxrjF7OoOaDHquzEobYD0f16JJDq+jaXErieMZU7oZDB5P3mSSK2lKNOp
 ZkP0HK+sp2ml5vm8zPLjV1gzwaB63s+UARI7JdOkqTzwMr80UrxhPjaa9SKB91k9uqy0M1bwhRf
 gQcwUYwKnf5MbDDiT1WyPjzEOAikmL5opCQtL5joo4WwsD0V310QhOPeq4MZ2rmjWwmjQIKqHPa
 UmJEMkvAETYEYIWy6VlL239KBcf3BHyFSnwGun3qN0B07aHOs4gSWtyf4bPMxluPbWINNCYmVDX
 bYl4AR+9Znh3hwIcULNzYq80Hxu4uKeaQftNWVlvix9CdnROv5pQNdb+xzRtiRxKdec0u67T3ps
 xeP/bH0OJAgbwAobdnoFYdgwF6r2+OJBhw/n0L4RMXf6YMAuPMZNzzDujXrRJcGp9I7IrmL09BZ
 dJMSz9zzZYbvCoAeYEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170060

On Thu, May 14, 2026 at 12:35:19PM +0200, Krzysztof Kozlowski wrote:
> On 14/05/2026 12:22, Krzysztof Kozlowski wrote:
> > On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >> required by clkref clocks.
> >>
> >> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >> differ. Document them here for qcom,glymur-tcsr.
> >>
> >> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >> ---
> >>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>  1 file changed, 57 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >> index 1ccdf4b0f5dd..57921cb63230 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >> @@ -51,6 +51,63 @@ properties:
> >>    '#reset-cells':
> >>      const: 1
> >>  
> >> +  vdda-refgen-0p9-supply: true
> >> +  vdda-refgen-1p2-supply: true
> >> +  vdda-qrefrx0-0p9-supply: true
> >> +  vdda-qrefrx1-0p9-supply: true
> >> +  vdda-qrefrx2-0p9-supply: true
> >> +  vdda-qrefrx4-0p9-supply: true
> >> +  vdda-qrefrx5-0p9-supply: true
> >> +  vdda-qreftx0-0p9-supply: true
> >> +  vdda-qreftx0-1p2-supply: true
> >> +  vdda-qreftx1-0p9-supply: true
> >> +  vdda-qrefrpt0-0p9-supply: true
> >> +  vdda-qrefrpt1-0p9-supply: true
> >> +  vdda-qrefrpt2-0p9-supply: true
> >> +  vdda-qrefrpt3-0p9-supply: true
> >> +  vdda-qrefrpt4-0p9-supply: true
> > 
> > Either I do not understand your previous explanation:
> > CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> > 
> > or this is still wrong. There is no TCSR here, so this proves nothing.
> > If TCSR is TX0, then you do not have five of them...
> > 
> > My previous comment stay - you are not describing the actual hardware
> > here.
> 
> And it should not be my task BUT YOURS to verify this in hardware
> programming guide or manual, but nevertheless I did verify and the
> manual DOES NOT mention these supplies. For Glymur, it mentions 8 reset
> ports and 5 clock ports.
> 
> No supplies at all.
> 
> Then I went to QREF and it does mention few supplies but completely
> different, like mx, cx, px 0.88 and px1.2, so none of this matches QREF
> either.
>

Honestly, I couldn't find QREF LDO-related information in HPG either.
However, you can find it on IPCAT. For example, in the glymur power grid,
these LDOs are clearly documented under the LDOs required by each PHY,
even though they are not directly supplied to the PHY. In the QREF
diagram ,you can see the complete QREF network.

Of course, on some platforms — such as monaco — although the QREF LDOs are
also documented in the power grid, there is no indication of which
specific QREF LDO each PHY requires, and no QREF diagram is provided. In
such cases, we can only verify this information with the SVE team.

- Qiang Yu
> Best regards,
> Krzysztof
