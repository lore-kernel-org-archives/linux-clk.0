Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0FA46982B
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048567; cv=none; b=MnOQ45u1ruzZ6TsCLAFdH/77fR/OeITrP1akakWzmDcvBpliUQUIz8ERlaA5r6Nv54TlvH7FpMY7dF0hOWnJaJ0/dHgcYcTAczgVyAsH0eqV66Pufp0AkA+j5wCY3535pJIt9n8Le5xRAqyOAR9AyaaP/ViGNIZnFVwg6ifXJOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048567; c=relaxed/simple;
	bh=5hP/z2g9RhZQhceP4kiG7MEcWPAl+UFiAdLd/YUGRc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GOHlzHgv+hdDTKf3xo6UJBBvpCz5ocp0RPhPObCrV0rzkFnY972bO5tPPECwwIpzwECJ01hZOsIyZdc5LgOh8cUzi4BdfVv9tVqXAYQRJN/31bXZhA6hocI3WWAzaCXv/vTfnQbRAETBUwwqZHA3Rvt05iARj0CsVrudZW2mOVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tp8DrBzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f92HAXpW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tp8DrBzy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f92HAXpW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1iJ9L3468831
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=; b=Tp8DrBzyH98g+lpe
	tEXFGwa7+CB5rTxZj/fG/lKxrANcouNKIv/38xRqFcSKSRfVXMp0ATkb/RhaSpi9
	ZkU8VzeduxY1cxBH9UUx0uox1T1VX5ffZicOznUxi4uMmKe8h27ro5fzXvRw3Qaa
	4dLdtzsuV8kxRym2vvoJNYRjvnQfL9SMIwPCwl/ROFjkj8bs/948KjUqhsbu6gxO
	38zohW36N6xpgbjLk/dWsTGoMiOv54RrZaz0y4RmhK2PwSxznubhq72zwjA2IWZX
	kmDQuqw187Xe2Ko5TbIoMHOctGCKqCDKFmnrkweZTggZ9fo8v9iSpxIhFaSxK46C
	eqssRQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7ax5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 07:15:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so6540802a91.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Oct 2026 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048556; x=1792653356; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=;
        b=f92HAXpWpXmTu65+pSNFb3qJ6tCT+pXMbSmmrBMPX4du318wbFKtFXne8EvNeC0Uny
         Xy35UrYhxjyKq/MbnDoIIwoclE0GVD0m9+e1DBVkGIIOVlLEo5rvHOxjm1bGkD/mNrgM
         LDpoLoJM3AZNO6LO4KR3j7VusZxYXIzhUAn4eCrEN7FdlGzDgn50BBswHIWf4kRjOynk
         pCsy6SAtZu4Bip64M9UfP3/zzpDhASAwptDs/BTU/n9CTd1qluRDZog3a0PgWRYKLuMn
         yQ8bGA4mB9GXxMCVa3kHfY2cz1qmUep6QkVUK8rCTKgU4XiUIxbGNxGCc5UpRTjdi4Qb
         a3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048556; x=1792653356;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrpTM3AO67M1UpQn3y7wQiJtLw3mP+ElEJv/0iNL3eY=;
        b=SWdMEeRImHtZKccD9mOKdIMqqaz+Oo+9DRgDn6DxZO6qsGRa1LIE6DKHGjVyBKXAn6
         HX6sl0/aQUQSr9Scu6avAECikSSnGc01AI7qj0PgWueimSB1nUd9ua14YlD/EHEcJDIA
         YUaqW44qwqWYC/Xz3SDejMh7x6fKpK+Mic/jcvqMhfF/N27J9p1qx13oLq44IJyQtsHo
         o8C93AnWQf65DtC+BIls2sDRR7/CoTQsgCMcv0EONU6msC8EbnKo0nKOhJeKq6eQqCZ/
         8K/qS2ENK/YnI9eegfZRdUhYFUK+F6A7t3AkOc9ElwxEDYAk9WlVItK03QDhVxWczmpv
         P9ow==
X-Forwarded-Encrypted: i=1; AKwUvByaHiKsLEemYX9tRIEYp00rpuiA507+R5m/uZwTLztRyK5zOBGW3emib5NNd7VCkjwrK0+Q1Jc7hCs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLg2yrWrgc1C4fb+Np0kIRFgOEGOPpSDroCJ1fY0q88XKf/d7pn
	jNquP04ucW6TywCIryrB4guc5ygDtplsW5L0hcBtP4eT205OOSTC73J1bl02Qw0iL4XWlYKLA5i
	nB4223kQeuySkCn5qw/1hWUR1AEEWeV3lpOcQMRBJaoe0CcQOfBKhefFIJNIV4Es=
X-Gm-Gg: AYBFou0gENHKNeL172gYFI0K/W6Stv9JI5/tlWgCBvDYP2jDZG9m/uic82YnGbiru5r
	REq4z8Mg1gMx9hBw1IxapvkNWSEaThtwmyJBYWald5Apcn6u9dKeDB54igblIxMSUouYMOy+w0u
	m6R7y00QpjqbcWpAwzGPNyoZ60Q5y4xyqpRzRdrjZ5TfNOdJYExR46Vn/EfomRLUT2VPEU0Mvka
	sX+fYaqBgCQa7U0vyQ6bQ96IwALKSWG2dEqozlDx2A0bYpAKddkF9lao8n9y7y5kixtH2CXPlpu
	UqC4982KMIgbtsaCuj210sS7TeL1gC308Q62NLN5HTcTsuQSafq3HGgnNDVtmV7WyR+gfKqhQj+
	NzIaNTojq/XH25EjUSia8VxYkLGU=
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr8191863a91.27.1792048555712;
        Thu, 15 Oct 2026 00:15:55 -0700 (PDT)
X-Received: by 2002:a17:90a:da85:b0:3ac:1c76:61c3 with SMTP id 98e67ed59e1d1-3ac1c767e3fmr8191833a91.27.1792048555149;
        Thu, 15 Oct 2026 00:15:55 -0700 (PDT)
Received: from [10.217.216.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac92a43d98sm1617534a91.0.2026.10.15.00.15.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:15:54 -0700 (PDT)
Message-ID: <f25e31fc-4767-4c1b-9c34-2b2f78444967@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:45:48 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom: Add bindings for PDM GP_MN
 clock divider
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20260602-pdm_clk_gp_mnd_v1-v1-0-1522662b6c53@oss.qualcomm.com>
 <20260602-pdm_clk_gp_mnd_v1-v1-1-1522662b6c53@oss.qualcomm.com>
 <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <bc3cdd77-9e67-4e72-9144-af854076b74c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad07dac cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=GSbrFnjROjb0KAz-EnMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: UAD20rZbkkqgLoSfG5U6sooByi4m2MOf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX+QBiAywmycjn
 O0plYq5kDBS8CEwl0Ozbw+JRDQCG95GF1zgtdz60EwOe7On+S3CYLRhhWcA63dCTGNoVGXzAZR7
 Lzd6qLGYVMOqTIaTR2E//pEVZ0Vxr9KXUHS60mYDt3bWShAr759COBmOZpi1KpOmJSPROrEgNN0
 eh46wW54B8T5nyOzqEqAj5oRj1/M0UWlblz6ZzZLM2jpFBJcS4SX+D2CsVhkBbYTM7u84eeyKkB
 vE2SB8FxnhR+Dm5iJNSBa0JnXpzmKWQ+zW5JVTlpiGIlp7wQyio75kza6b1iOja7h0YsZsuc0E9
 zl1uea46nz/qMJxQ6S7JO5VoxY/ipdHg/luLpBkUvW+H9UKaxjqnIFgjRcxpMNzz4oKqLrUb+09
 4V+uavksMUpNvuib6Bek9ZvKDlurv9/qAMN522MjoBgQpiM/0hTMaXK+o+b4A92XCnhZJH+XuQL
 bJWZgpxdS5J7JQer34g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX6umJXbAUMSZC
 mR0xa+QQtlC/607Lh72SskV3FxkusGcchJ4cxCLOsNLvQsNa3H8Sy9Y/XFmGAkPQYq+yfXvRDbO
 BVU287igHOAqN1OqHKRPxAHO6xikk2M=
X-Proofpoint-ORIG-GUID: UAD20rZbkkqgLoSfG5U6sooByi4m2MOf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150028



On 6/9/2026 6:54 PM, Konrad Dybcio wrote:
> On 6/2/26 5:21 PM, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>> +    gp_mn: clock-controller@88d3000 {
>> +        compatible = "qcom,clk-gp-mnd";
> 
> The compatible must be SoC-specific, looking at the table, we could
> use these example socs for the versions of this block:
> 
> 8960 (v1.0.0)
> 8974 (v1.1.1)
> 8994 (v2.1.0)
> 8996 (v2.2.0)
> 

Apologies for the late response.
The GP_MND block does not have any functional differences across the
supported SoCs. To reflect this, the DT binding will use a SoC-specific
compatible followed by a generic fallback compatible that represents the
common GP_MND implementation.

compatible = "qcom,sc7280-gp-mnd",
             "qcom,gp-mnd";

>> +        reg = <0x88d3000 0xc>;
> 
> Let's map the entire 0x4000 that this block spans
> 

This region support 2 or 3 different blocks of HW and they have
different functionalities and for which I am going to add the driver
support. What I can do is map 0x88d3000 size - 0x1000. Please let me
know your comments.


-- 
Thanks,
Taniya Das

