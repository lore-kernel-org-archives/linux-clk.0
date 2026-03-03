Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F1725782D
	for <linux-clk@vger.kernel.org>; Tue,  3 Mar 2026 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544921; cv=none; b=WZHD/7gY20DAqIzn45qnI39PrmEAU/a8zM4ae9QShDC4qyr3YFz8tyPNSvk5iyq4oyCpGYzm61ilMaMgwNjn+BJnoFaMl2r4eAgU0bAxEjmYz/p60t5qqRrN7VbY9thEBIcoNbw2XGHZ0oRIEGfgo/X/+RXYJqYu4wdnQAFt218=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544921; c=relaxed/simple;
	bh=MUQCZt8SC6oRsgXEYYBZNhvSs8c95NHMWCvK4DRBGxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MI0qC2df9kv2AmRpSYIXjB0wW0SDnJG0FUR70op58oj2lRoKQz7mxJnm2fMI4MPHOi69hc1hInvSFpQ8MUJIw3C4u5USs2dgySbnmJKcZ05xNi6udFtNn+IjLtDQiIaRCXRF35SjeLSkYz2J5X0hTxV6JVdMEtBUP5Q1QVuojW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjKfkATI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfqKOWCP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjKfkATI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gfqKOWCP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nIJp2630357
	for <linux-clk@vger.kernel.org>; Tue, 3 Mar 2026 13:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iIDdHFjvuX2Cl2qm4wnbyb9t
	S9gbrmx/n5LQeTmw3+E=; b=UjKfkATIJMdRvfZlq5+KSkv/9GEHXh368xPy4GqF
	xb09kpaqeLIj2UweoOCEGX0qTN31TDmp4i+EJYGR7uh14we7obTNcdSB2GzF//6O
	G4zss0X2/ceTnHS6bkU30h+T8P6gw8HzyIDTIAarzg8yX3Lj4sRgiKYUM9VkWkyH
	N5ffeWHgxM6hF8oK+4yVT2Yq0o+XtwyWH9yLJqo+wKqE7LaZ20L7rNJjgNPheNdh
	mJhwWBzAZxMuH4Lg6ZowZyBRjOXQlhCQMocXbiAUEDNiSNl07jdcRNZHs30Y7Bg7
	iMOCmElfRdYdAyt6mv5EzrjY/+Yb3Uc/nb8Awl6LhZSi/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhx5ay9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 13:35:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb403842b6so4476471985a.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Mar 2026 05:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772544918; x=1773149718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIDdHFjvuX2Cl2qm4wnbyb9tS9gbrmx/n5LQeTmw3+E=;
        b=gfqKOWCPZP3noVzdQ5SBGVhs0SMPOd+pU4xiXHTiPIXj4KKsWLdXcpCZRHXG97a327
         sTNFPyOoc9bqnPfnxIMsNsmbeLmJQgnkfEX+9hCRoSV1Xr3KjzVDMXsDqysGqGllOH1r
         w92SddUVokAPNVrkAteZNXn2hq6HHCVqsm3maPtu1J7qX5HzweYaHrweltrmy0uEl8+b
         Ems9tC4XEQviyGI1x4qNkO7X2WqONt4rjUEPpqGH9jPotxaIs7yIl/09fXel15QIYoZk
         jf91bKO/e68VCalFC3rK8vGEqvlo8alKEzJTEL4LiKG7h1bt9g/mytg0ERSTDFWD/0VI
         V4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544918; x=1773149718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIDdHFjvuX2Cl2qm4wnbyb9tS9gbrmx/n5LQeTmw3+E=;
        b=WDYWk1m/7NVx5xSdBUfKz4LncSN70W5Oji8adPE61UzjczWkUvRfS8VUU2ePjzl6hL
         +vosYW3Ut+rhrkxjLRmTa4EPClN7ud00/M3/O/wptTdwUBTwQEJGYaFuTT+Eu5a3Dpi2
         qOnlSDa2utCL17zJQAU2OQ6EnHkqcQ47yhVPCzFB6VPPbWbV7I78AGOhaNcKgiJqkxWQ
         4CxYMBO/dCdWsuNoSkAGrhV01vcRz5T2bY58Zalu56vvlGLGYlh/tJlhRVYuVxFcwcB6
         mbTihBYyZjhD9PIt56uIUQq5GSN9gM9Z/Ftxk6FytLsSq7Ph3nNFwRV7szCOqswMGMDZ
         V1yw==
X-Forwarded-Encrypted: i=1; AJvYcCWp5Fmhg6DipqbQGJrZAUWDS8rRn1O5Gl/cQHTU18qfLQ4jKSYThZydUSaIAQa6EanbWXwfriLvS/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNlH71/ATTfE7k9G+SNfloqrVwKU1fclalQ2qyNY/XMaGEgGdn
	OVkT1SFewwHzaNFBLTH+udkoL6HiWjZ6iZBfJ/kzqqquTioTpxFhL7zaoxi8oIGXu8C2I/Wt5uj
	IK6pWbWNlVFzebjXV4b291W8ZRixjZDVKYZcWPig0hBKOZVvvWqzLGkP9IRYHWoM=
X-Gm-Gg: ATEYQzzz2M2lhIHyLaS0xe23wrWjHUY67sBmXtsEf98TNYSvnQCg0lr3a+phTF7lfpi
	nRIYeconuXg4HYiAeAEygRh0LKGWaqbc/thAY+cnW5RuYRfaqrmjUlK8cY6WIcenuZVTZtah+Zp
	fkQMBq/Ey6yN5pHoQOGlV+rqlLm5qjD3oE4NgxpurlZ7TDKB5x+w5nBLzIMAUN0UDRUfC9cQf3O
	bFlyQRyOfm5LoX8K81fo4o5MZowrDn5AopFc5CwCoP6Y2doaP6a01JnTE69WoHCCqMToLMyHy1m
	UfEAc7bmCJxtpkAYjH0tgYe3zGFLVLQfA/6zVDfzx+JG5GXFXnFAUgiQM8VpKGhpynNDDU2C26x
	2ioXAghcOdZ0hGOENJRnAhiCtfHg+h1q8YK5y
X-Received: by 2002:a05:620a:1aa1:b0:8c7:995:b961 with SMTP id af79cd13be357-8cbc8f2b066mr1941903085a.58.1772544918104;
        Tue, 03 Mar 2026 05:35:18 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8c7:995:b961 with SMTP id af79cd13be357-8cbc8f2b066mr1941897985a.58.1772544917427;
        Tue, 03 Mar 2026 05:35:17 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485125bbb48sm27812015e9.0.2026.03.03.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:35:16 -0800 (PST)
Date: Tue, 3 Mar 2026 15:35:13 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU
 nodes
Message-ID: <5fsq3ex6d6ytzus4n6smkd4tkxvsl2npxjdlnj4m332lmiad22@iu4f3ij3ozol>
References: <20260303-gpucc_sm8750_v2-v4-0-2f28562db7c9@oss.qualcomm.com>
 <20260303-gpucc_sm8750_v2-v4-3-2f28562db7c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-gpucc_sm8750_v2-v4-3-2f28562db7c9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwNyBTYWx0ZWRfX9lGv88+QIUS4
 sIN3XfdgMvMqBTxkFOPlA81s/GUZQ719x0cYs7H0AGCNXlO2SC03StqPuDs86bLMJxArgWQ0IX8
 qVBTKL1nLajDkDNpdPEWVO8Ftqo1eo0lIoKC8CMEJfZFTHjKBbEVVY91Hx1Xj8Dj2fJiCXPKTwu
 PACXL+CWG0BmLmarRz9kFaFxdCw0dhDhTg5eTEckTo0VYVY68JNkHINsoJ7AmNyMJfqyCJPViwS
 Wyv1ZkgAHpfeV9i0dmGE+agXn6hg5crLX4XOu6oxvF23sbHB83EtOoCoyZIb8HyTAL5J6LeSFem
 gTPIrTtfRp+nZWyXvsePw3iohf2exg21f5NzVbHGkr7RFNxvKkmDl8xwjEst9l3NRrbyc+9gHRi
 6W+RBiIU0KfcmDzbXjaGcdtNRxtCeg+9CgMtiQ4GKCU6r8vBm/0nFycFE8JxQaJSBukGG3CdKor
 XM9sjxW5MUYjkYPVnJQ==
X-Authority-Analysis: v=2.4 cv=T9CBjvKQ c=1 sm=1 tr=0 ts=69a6e396 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sWMdH8d5cH_G3Qu0fyEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TRP2t_-fxjqJ0xAjjenwpbWgwJXxv7rS
X-Proofpoint-ORIG-GUID: TRP2t_-fxjqJ0xAjjenwpbWgwJXxv7rS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030107

On 26-03-03 15:05:27, Taniya Das wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
> 
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
