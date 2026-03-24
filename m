Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC273DDDC7
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774344174; cv=none; b=Q7yT7fh3uUwAgHwcDorsMNge5XyIQexHSdSlHeLqXGzNjOMM+8MlCp7ehTUL0oCcKmAhOZv32ZcFATrP9gkYZanSN/VF3by1sUxivnYuru5R5YmXuHMo2CmBEb7gUUzzo7mdbjf1AhFp/g/QYBf07EoTo2QYHTFriymPTzQt638=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774344174; c=relaxed/simple;
	bh=kkRxfV6Ja099eNBNfyWQ+upuon9G/3oU9DqP9SCnCS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R0EMNdRgJ4TGNWNjhcNMR3YGbU9/0+EZCuQkhKxPRHzpBuS6NXNiNVaftRIprDRoSrUlb8Z3eSyAY8IS0kNbn/KwN6eChYyHlDIIWXhibRS3WzvReNyNMBrYhoqZloHwX6IyVT4osp0YNiA+tXi723ZtotxAot6YPF44pVb4pB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miTAbO30; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YtJRPrpr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miTAbO30";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YtJRPrpr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O7REB02371490
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zP3x5XBqrk0612p+N9oFLfTLt7PEBP1H2mw/MtuC6Y=; b=miTAbO30QcsETKWX
	+yvT2JL2akDYogslAmmTFRm3Yxw/Bl+5ajKEYLE2HXPOf8H/jF97Ut2sVEuzY2EE
	ZlL6FC624ntyXgVa/LIFc6fb2wa9waafdFRZ7gBVVRKBUYwq2ykRR2lXRB14zdAW
	Ygz87KrIlJfyLYpscL0voZk1DmzAeY80X01ZaBnk/ITYOCeXwoTQ90lqWwjK2lU3
	DWYQrgwLU3AMSYBun1JwB3ipGbZP7smeEHqHQxoxMlRXAATt2JRTbzoTAErmo7EX
	l/1ivZJiTNXXpHuaICaA46EDad8ZhCzk19OiDWTGFEXsSauLqTw5yafgnn1c1wAr
	yPxLaw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3p830cnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 09:22:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b317c4041so33645011cf.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 02:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774344159; x=1774948959; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zP3x5XBqrk0612p+N9oFLfTLt7PEBP1H2mw/MtuC6Y=;
        b=YtJRPrpr/4hk7LBIy9AsjWFAy9CraKH+D9C5mLXrT0xTzj510mii9D6+r8FHN07h6v
         UkyLaEprPLo4/JzUvpOG1I71/xxynXCnaE58CUmPYDD8UtFstGvlnb1i6xDYLp4AbDsl
         qijRVTL0IoNw4Ztcyt3yMm/4f1958AP9Yu6dvOwzaOIFLcSp8aPdv0ulLo5o9SSP+kz1
         rnCMVS/caCEYY8oj67vJnBHup6RiuFqXF7i+Vp8aSYZUbSFnTGXKp1p2PE/CvAQtXQkr
         2N/Uwv6EH6W2JsdcxrkKpoPDGDvclwXpS6o3mjiUFypdwGTSI0mN40sjkrlGL4NkLCbA
         WpAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344159; x=1774948959;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zP3x5XBqrk0612p+N9oFLfTLt7PEBP1H2mw/MtuC6Y=;
        b=mkMjRSrSJOGnM8rceikXlUXHwVNKLDMoFas++VYpQQmfobE7DrUMfLvpZISLDFK3Dv
         RpBwfOa3NuktJamG1kFlTVqlVexW4JIkSAO1GkH9gvyNaWfHIkJ2j2YiMsiGiS3IBteb
         yYz7TJS3ulIwvvb7dhnIVn4beBIGKbfsNtYHHnfffOxdlzFKDVS8P1tA2MpurpaFl1r8
         z3FO9PeqcSODViwXOrv0o/Oa+xamT9Ryvwr2l/0VaBAeRHEzDQJdaXmWGnaPwp7sEL1g
         Snsq/YmtNlOyhljKSjLsbgkk5/qifT1AII9Q/nNrwrM5kW0hsxqvwhDQqFalU9ikMCIm
         skQg==
X-Forwarded-Encrypted: i=1; AJvYcCXxDCS/4qtCaj8hYNvpWcpbUTvv/nKu88FYM62IvFwj6GLsSlW4cxrxks9VRdwrPXYFAobfeCX/C+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzszvXFPzi6gbs3DCRuvVE4p7p/DhVPYFT5v+6OaDJzStTP3sCm
	seGTzpojQypdsN9g17UPGH0ZhFPjggOL18G1fjTMPdPU5I0ABnH1SxVrEudQQTCx08qrKFfSwrB
	XzA7+nEodZzF+cnyqZSCrRi8RIKcAH1IE1UpEMMssd14SAQs7YfaHNfwF9XQolXw=
X-Gm-Gg: ATEYQzyM6jp92+TCChrNk0LkYUWeJ6yhZXMmciOhPPG6XGiiAromlzdhLp846X0vvHd
	r8ltYOtqkD2DN/qsbN+SlRfsoKSsolmqLl0o9CGBZRzNbBUqQv/N5DCVCqwZylRPM3vHMCDmO8M
	2iPdh79XSc+M/KgaPr25U0ZtvEcazo34rM6j6AqNFPY2g28pjHCU3L9NGWDUQNm1550KzaABxWb
	z1jmaqChh384mgtVSuAMMR/JU4LgAYHZJQK7ab85QkDSz5b2Q7yHT34pLulfWeveREQBf7ryHFU
	jXNkriCt5V4WAv4KB4czNsAVLvA8pCZNcZtkBtjjQUS6Va6YTqkJngwYolJmhHIJOSqOTIj6Cd1
	g7tRvHWKEvCYjXs8M3xFC4YANS11WL8JuOfhuLwjuKLBEnl9ma2zSL1YHGIS+iPZ5DsxdUD6u5l
	+LhHo=
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr172348811cf.9.1774344159331;
        Tue, 24 Mar 2026 02:22:39 -0700 (PDT)
X-Received: by 2002:ac8:7f0f:0:b0:509:1924:3f60 with SMTP id d75a77b69052e-50b3753fc76mr172348711cf.9.1774344158858;
        Tue, 24 Mar 2026 02:22:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398d82dsm611474866b.62.2026.03.24.02.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 02:22:37 -0700 (PDT)
Message-ID: <ca88ed26-51a8-42dd-9b1c-3266a107c180@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 10:22:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260321095029.2259489-1-mitltlatltl@gmail.com>
 <dda88cb7-090b-4baf-91f7-e6724b506134@oss.qualcomm.com>
 <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vonorgmssumelw3nkgd335lzi3eekinlslqb24k5lqwzil3tyh@epcgwiiu3xqu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3NCBTYWx0ZWRfXwX69o0U8i0Jv
 NRRvoy6iVLI7Qn+qAwcD0/4YEYfZkls6Y9Tn+GD4MY5nKq7wMS0MOMrL96AN6cNMKsvPYUzf6Zw
 GRyFbwdo5rrjb7YNV6v+ZQob9VhcseOFdVbBUCvC5qmHk4r+AdmhFRtGpePfDEdr6wp6691H+6P
 cCesj+WJroRhQPe5h1sWioGR4m70x/JOz/b0ToJ0ECp120VtVukaArwpqkAegfJa9vWxOacITIA
 a+h6RkTCCD9MkbPD1r1XSkPQMVgsQJsdCMiIDlNv3co6yxd+zVfFZBN5uev1JDCwVsFD319kraQ
 B/LU9Z8ckEk4eBMAQlT+LV/OAWBe/OBpQB5JHTjgIAmiM2uQ06+qnAMTubUr2YdHTfXX00CwnFU
 U9FMLh20en2DNXoyfUnnonuYV76AZrgTcjekjN4h33oiFW9rg1+/x/O0adGkwDtaI49Bdvyk5g1
 zl8lx9ldTzFgF4+UxoQ==
X-Proofpoint-ORIG-GUID: 1bSP_Jpeu-tlUl4QjgBoTiZZ8DAriYBv
X-Authority-Analysis: v=2.4 cv=F6hat6hN c=1 sm=1 tr=0 ts=69c257e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qC_FGOx9AAAA:8 a=eV-8nqNh-aYkQHMPB9UA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: 1bSP_Jpeu-tlUl4QjgBoTiZZ8DAriYBv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240074

On 3/23/26 8:23 PM, Dmitry Baryshkov wrote:
> On Mon, Mar 23, 2026 at 01:54:29PM +0100, Konrad Dybcio wrote:
>> On 3/21/26 10:50 AM, Pengyu Luo wrote:
>>> Recently, when testing 10-bit dsi C-PHY panel, clks are different
>>> from the usual. (dsi0_phy_pll_out_dsiclk's parent is dsi0_pll_bit_clk
>>> now (dsiclk_sel = 0)) And we failed to set dsiclk's children.
>>>
>>> dsi_link_clk_set_rate_6g: Set clk rates: pclk=172992000, byteclk=108120000
>>>
>>> byteclk was set first to 108120000, so the vco rate was set to
>>> 108120000 * 7 * 1 * 1 = 756840000. When we was trying to set
>>> 172992000 on mdss_pixel_clk_src later.
>>>
>>> Since there was no matched ratio, we failed to set it. And dsiclk
>>> divider ratio was set to 15:1 (wrong cached register value 0xf and
>>> didn't update), we finally got 50455997, apparently wrong.
>>>
>>>   dsi0vco_clk                1       1        0        756839941
>>>      dsi0_pll_out_div_clk    1       1        0        756839941
>>>         dsi0_pll_post_out_div_clk 0       0        0        216239983
>>>         dsi0_pll_bit_clk     2       2        0        756839941
>>>            dsi0_phy_pll_out_dsiclk 2       2        0        50455997
>>>               disp_cc_mdss_pclk1_clk_src 1       1        0        50455997
>>>            dsi0_pll_by_2_bit_clk 0       0        0        378419970
>>>            dsi0_phy_pll_out_byteclk 2       2        0        108119991
>>>               disp_cc_mdss_byte1_clk_src 2       2        0        108119991
>>>
>>> Downstream clk_summary shows the mdss_pixel_clk_src support the
>>> ratio(35:16)
>>>
>>>  dsi0_phy_pll_out_dsiclk             2       2        0        378420000
>>>      disp_cc_mdss_pclk1_clk_src       1       1        0        172992000
>>>  dsi0_phy_pll_out_byteclk            2       2        0        108120000
>>>      disp_cc_mdss_byte1_clk_src       2       2        0        108120000
>>>
>>> After checking downstream source, 15:4 also seems to be supported,
>>> add them two.
>>
>> I don't see that, not even in the newest releases.. Is there even a reason
>> we have to list these divider pairs in the first place?
> 
> https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/f7aec4359448d25c8a8d21ad8e8733d61f6b69ab

Ahh branching..

> We need those dividers to correctly program pclk RCG2 clocks.

I would assume that's the case, but perhaps the real answer is "because we
don't want to try all possible combinations"

Konrad
