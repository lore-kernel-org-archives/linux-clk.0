Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638624501D
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 18:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402515; cv=pass; b=QBerccbs2a642BkMCFKTf4477XeGUnhqb/zpWGytXoPY9eN48TdbdM3ssOc6pwI5BbmIjaHvfC7ZSuIebXr0HVUe9e5p8GDD6wLIEJ/bCYg10Y8RktO26VM63o5fYLv4tvhvc12eCXph9yv1gLQ6vsOckw9Kf7wk9uGC6+UyshY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402515; c=relaxed/simple;
	bh=48YB3Ndqy1orkOBGaDNajZ3kV1mp4TNcdrH+V5/Taa4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LWmurJ5G82cvwggNPefvaJBzWYceBNhvZ2aFZRJ7BhXFbshoyCLXvjR92RpOC6A1gtGTVg68Yedhk25rDQFZ2OPC/BqQl8OvCyKiTYpk2qS5s+39UK41i8CNVcwHxtut2SlLtVK2j6yZt4nPMkZmLv0cUfvtOIi0qNrckKSa2+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=or8t01Tz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kjDiTBAP; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="or8t01Tz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kjDiTBAP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsR1X3705150
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 18:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=442/8iOej5uMFBsrBy8C8V1f
	bre1zWZUcI0+Mu9/ZKE=; b=or8t01Tz4Y1qEm952d/nrUpv8nh2kDFsOPGBOH74
	WfVes2r44YAE84N4PaJ4tcozPzqROiqVg2M11dEEwahBvY6am9IpItoHf/4RTweH
	+por1ztFf97oGh9ef7rhH+6szEiGS+OTLab3yKfwI2AxYkA8JeN/POlHaXcoqsoK
	ASoqQUjw73dh7hj8nInq9uhLDWVJ5X0zAg9kwANaoA6kyN67DZc8ECC2SBzpaMMv
	5SCA+c2nkmepwnAV0FV8IynSkD2ZZ+taeUPnrKnHTzlJI/KgM0yOezh4pYYiUrcw
	b49rgL5rw664VtPF2X6lX4voeYrGff9tMp2JZ+a6EjAFgg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxha0k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 18:55:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f460260cfso11967797b3a.2
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 11:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777402512; cv=none;
        d=google.com; s=arc-20240605;
        b=EuSnqY9ayo0HdaUwiCseko9YdhzfMVkNTGhuGlvBGIxjnkSkmnbcP24gmR3Ve505vt
         ku6xDS96Ug4LJMWm1mfhKvDRBAbwiEnVvLseiLyIFF6mk3KB5v84e1yAgpx+U4tYaIgz
         uElPv7p5xdR00Q9vZhE8aab0QTd0firm2vdX6iwG47neuuQLO6ZtBt0v5R8kyFb8GHM9
         DKkt8CoyEX6zuTcupVhmER4pm9oox7wD0MVMae9lr5R5yscfPAFDEx3xokxQFz/ClJQs
         zrbJZL0Pm60ws6cmhqUFzc38ohHkNtqUXNlIa31CF668zXVTQpSdOrvnucD9Te6kOqEI
         /76A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        fh=OydfDTW1JT7YZpITCp1u9K9KxyM9qzplPzARR1qt9xU=;
        b=CY4b2FMrCQd+wucEcofZbh0Dcx/K2KdnWtqti4dpXoCcLATB0V9UholfmsBC7kgYIP
         geBFvD2qo/nPEI4/x6SxZWblK4mmSMsKd4EiQ2/Swf3B+QlzXfVxeRRyRQvjIXEtmMKm
         joxbUcVYIuRIZi6doq2vYCOC7rLXOOi8wfgx+IwJDuSeHKv8bkZ3BD25yrDWNxx8mZEt
         gXoo+YzoUBzb7ZSWnKVhHUbdgzL7e+hIPYs4CsWzcU8DB5LENnVNTB5sOvUcLImdoyUf
         nhU7eE9O5b11VHiCucSuW6FRPbJnDcBqlLQj8ES7e9rvyZsp5STTu8wUm2TFLAfH1SDy
         XZ1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777402512; x=1778007312; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        b=kjDiTBAPpTpQfr8TvSyZy7jjcbwhWdx362hfAblCd0WaA8MQ8jd5roHCDkGxLef6Xf
         w7it05j5t9s2CuJvWSXajPXD3l1iQhTlo8YvXu6MQYwwVmFYVyLxMC1A8fpy2/qsTLgJ
         Bk0238zf+x7tHXRbjK9rUaYYLzYfvuATKRmP6y7pQeB2Mq74kbKTfaAyxb+0fRZnhauO
         gVb9kG3vecz3AlBAcGljF7+MftxaKmzab7dKD2yp2uP7zRuukGQqC7m7nnDkLSEcbIJa
         SoIETQTOjbMl3w0aPfUkFvwA6yz2TqzulIvs/1s5SVNC/iMahEnc02ZiVFpV1z/ilppw
         xDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402512; x=1778007312;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=442/8iOej5uMFBsrBy8C8V1fbre1zWZUcI0+Mu9/ZKE=;
        b=FVy6ZpHreB2ZDsrG2q5UXVjS31Wv8jkap79lrTsnd1E70XrukV7GdJqF1t6WUV74Jj
         cEI/B7C0FZ1UfuTQYgN0AXBEH0SFAWdxIMn6VaeEBAtI56mGftqQBWmICW23H16FtUMx
         hrl7cnnIhlgKz5Y1wcRrUCHSJ7Cro8ypTiW84pJZqBSuzT1o4SoApKC0w8fb5J9+ZON3
         MEKnizJJJGqLmMt8vfxUe/ZLxDFPmZYreOzk4kSi9rrwluWcIxUJekkbsREezlibJDUv
         fYwmWzqzmV/ERuJT1T0f2ot8TeutGzmOCXn07SOIpDKYvM2Rk7ZBiGXcS6JY3PbLgKar
         VO2g==
X-Forwarded-Encrypted: i=1; AFNElJ+dFRVi202mKGqsxIaDDz2njv4LaSsu+8prIYe8pjex58OAIj7pc5CnitdOsoET6Tg4LC+gFZSLQrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhsiobUIDe2gOfx0tNDuCMQvGbtSmVPdee/SbOiBGXnpE/5pqr
	nDzPs6rXyIMafI4O1M47z+UF0xBIJf6wh1PRN55gjUZo7otR3nRaoeGdqy5U4id3u8riJviH/8z
	tZIncDorF4GP8Hnak3j9jxWPQKkpfalfCm9L8axelwnuJmk/lqlj4tlITYDwtQe7cM4JLy1ohHs
	PCCcArkTyKRyyUzupGaVZ8nn0KdTPzeMjlHRyQIg==
X-Gm-Gg: AeBDietmVE1uAzqtCo2M4QKhvk+b27QtJmXbZuQasBpM/PMB7dski9MN5o6/0vXsLrI
	7E7z5WNZI1tdHQ+Pklperdf42WAoPkA8PScY2LOmRY4pxJRqmbEfbA3+vh2o0edsiU7rwS8GDiZ
	wrPa6fC8mtOnBUB6SHXHxJV/yt1I4gIOxaYjHdOTFViaXxFkeuf/U/dpr//1S0Jn0HAxCOw1QVv
	OjKxk0Bm41+zQoM0DVIqg1gCICxnetd9CzIvyVPhzrKkCQD
X-Received: by 2002:a05:6a00:4206:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-834ea57fb2cmr557830b3a.1.1777402511955;
        Tue, 28 Apr 2026 11:55:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4206:b0:82c:9223:cc95 with SMTP id
 d2e1a72fcca58-834ea57fb2cmr557786b3a.1.1777402511417; Tue, 28 Apr 2026
 11:55:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-10-eb27d845df9c@oss.qualcomm.com>
 <vnil4gbkpenxo5o2a2df2ziuygqyyrzsj2bygqewm7n2rq5kbv@qbntqftfpsky> <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
In-Reply-To: <008f2f0a-2367-4d8e-b6b7-2421a4de88cb@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 21:54:59 +0300
X-Gm-Features: AVHnY4IiC0s9loCkcUtYnjwZYf6U05xc0VvVRDkF4BRux375tv-oGwdPaCptzn4
Message-ID: <CAO9ioeXQHDYRPW6HYQ7XXsmf1ovpJyqaXgnGaDVnACb3PW7oOA@mail.gmail.com>
Subject: Re: [PATCH 10/13] clk: qcom: dispcc-sm8750: Add support to control
 MDP clocks using CESTA
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE4MyBTYWx0ZWRfX0HIM63K1CR6Z
 J88PISMcyapfbQ2gU7WSEG829ocCDZUlN8SkYfe8b9D0i9aMubiKYSw789F8xdcs+hyCsIk5geq
 e5R7h7PSSJMBUu73YCYJj5auC9VykFhvTkniJ2BjadB4x/W+GXj9SoMFZq+h1PE1cd0+jnjhfUa
 dgkbJxHDMOgTh4XCrmYlhnUEFJLbBRHIkM6h+itZfV/471c+xX8NmBrdUiqlbRt/EX3FUcmM40L
 37EWgPplFZFlj5MkTscT8cvnHNfqThDd+7kRwkdQQyJSMpO1Jvmex77CdCbStq5JU1jrqF/aY9R
 e9x5Z8LHPM5vpkQFtyCFy1KjSrKlzBU6FreMoMcceeDx153R1ZcT/Ib7+vEYsVR56gaMyDgEUWz
 MHj4q4U4ap7GN3oZ7+MH52HuMTUa2C3Nmr9MElp3heJGTtrTX8nPx0IfyXzQC88Q+hn2ExwEfRm
 UGsD5Z2qMP5MQOR2Diw==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f10291 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=4jyo0phO276cF_ToP1MA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: oQQwekFnu7DMTMWrEL_rED59XG4bX341
X-Proofpoint-GUID: oQQwekFnu7DMTMWrEL_rED59XG4bX341
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280183

On Tue, 28 Apr 2026 at 20:22, Jagadeesh Kona
<jagadeesh.kona@oss.qualcomm.com> wrote:
>
>
>
> On 4/23/2026 12:03 AM, Dmitry Baryshkov wrote:
> > On Mon, Apr 20, 2026 at 09:59:03PM +0530, Jagadeesh Kona wrote:
> >> Add support to control the DISPCC MDSS MDP RCG and the associated display
> >> PLL0 using display CESTA hardware on SM8750 platform. If display CRM is
> >> enabled, the clock ops of these clocks will be updated by the common code
> >> before registration to use CRM specific clock ops, allowing these clocks
> >> to be controlled using display CRM (CESTA Resource Manager) hardware.
> >>
> >> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/dispcc-sm8750.c | 89 +++++++++++++++++++++++++---------------
> >>  1 file changed, 56 insertions(+), 33 deletions(-)
> >>
> >> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
> >> index ca09da111a50e811481fd862b54d454de024d1c9..328e43b52192702dbbfd1ed65737520acdd4a649 100644
> >> --- a/drivers/clk/qcom/dispcc-sm8750.c
> >> +++ b/drivers/clk/qcom/dispcc-sm8750.c
> >> @@ -71,6 +71,16 @@ enum {
> >>      P_SLEEP_CLK,
> >>  };
> >>
> >> +static struct clk_crm disp_crm = {
> >> +    .max_perf_ol = 10,
> >> +    .regs = {
> >> +            .reg_cfg_rcgr_lut_base = 0xd8,
> >> +            .reg_l_val_lut_base = 0xdc,
> >> +            .vcd_offset = 0x268,
> >> +            .lut_level_offset = 0x28,
> >
> > Seeing this configuration makes me even more sure. There is no separate
> > CRM or disp-crm. The CRM resources should be consumed by dispcc.
> >
>
> The CRM can be used by interconnect drivers also for BW voting via CESTA.
> Hence it cannot be consumed by dispcc alone.

At least mention it in the commit message, please. How is it going to
be used by interconnect? Will it use the same API?

>
> >> +    },
> >> +};
> >> +
> >>  static const struct pll_vco pongo_elu_vco[] = {
> >>      { 38400000, 38400000, 0 },
> >>  };
> >> @@ -89,21 +99,22 @@ static struct alpha_pll_config disp_cc_pll0_config = {
> >>      .user_ctl_hi_val = 0x00000002,
> >>  };
> >>
> >> +static struct clk_init_data disp_cc_pll0_init = {
> >> +    .name = "disp_cc_pll0",
> >> +    .parent_data = &(const struct clk_parent_data) {
> >> +            .index = DT_BI_TCXO,
> >> +    },
> >> +    .num_parents = 1,
> >> +    .flags = CLK_GET_RATE_NOCACHE,
> >
> > Why? It wasn't there beforehand.
> >
>
> The PLL rate can be changed by CESTA outside of the PLL callbacks, when a perf level request
> is sent via CRM API in RCG's prepare()/set_rate() callbacks. Having this flag ensures that the
> PLL rate is recalculated from hardware every time when users query the PLL's clk_rate node,
> providing the correct PLL rate configured by CESTA.

=> commit message.

-- 
With best wishes
Dmitry
