Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A0343C04C
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782830239; cv=none; b=LxwtCoGyxPrlTXjYrW4zR+fPZOkwO06OrV1z4nlUPcflT+Mm0y0mHcfGE/Ne3+bdrB3csFAqO5k65imOtuOwGEHCFnJSH0NU5v1uTXdX3Uhu6BwnQk5Uf+Uw2WJpzminKC3zTbSUhSesE4Z715HeQ7EDtWnKZAcA3ndwjb0VP98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782830239; c=relaxed/simple;
	bh=VJkPOlo31BaH5cqVAnma8Jzets8wHIHf0hQnL3y1Yls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I7DNYbEnwKQZ8CiXkmY8cGwStK1/ch4mkr6DbygNdxQhPcZ3jo4LXtgBzqIbVGoX8oBv/b3HgswkNoOa8nX1+oLJLTc9WO/YculSV3UZM99DaopnUIPo8oyMGsGNkfEUfRvHt0SmQlmOjsJ+fyTFYTkNeHDD4rYRARNMvmapE1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVMMHtM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/Vg4rS1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVMMHtM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/Vg4rS1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDR062225666
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bh8SlCTfNpOE7sOPuwSI5J0e39QVe4ueR4PAofbIuas=; b=lVMMHtM8FRGe+Laf
	ihUgoub3OjXSvAFK4payLgH0Gz8MVxGvsr6yhg5s6f+Q0Duf0GHLSCBm9k4Fle4+
	7WRrwJDo9cKtNt7rPQ+75uu08Js5kDQ2NjUxMgKIVM54ew8Ig6ZpEx+wTr4BUxjK
	/AfG4RbWuJeWm/J3Ve6GfFtEzXlohIHJpR33bdfPgWRhP6JHZ9Ojo/04yXhe7l61
	1fMFbW9sx51LqubHB0lwD6nkqRqoQGeygQpX/AgWy6EyNII+2fKSXR80RoSY9hb8
	Ls3T12v8NREsVzDoDHyRkAjkckNBxxj63/z1j19Qg9FdE557dpyx1WqXxlkmUe42
	+N3Ntg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gu54e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 14:37:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bd91d5907fso117662e0c.3
        for <linux-clk@vger.kernel.org>; Tue, 30 Jun 2026 07:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782830236; x=1783435036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bh8SlCTfNpOE7sOPuwSI5J0e39QVe4ueR4PAofbIuas=;
        b=K/Vg4rS1BMSLb+7PH6EjqWnoDV4IavjU+pqlJj65rUDs8SNL8Lf6kPXzQgLGYiIOc1
         3MNtAB/l8wVU5Zam6fSLIQWo/WG9Es+YZstJPmbkPQT62vSLiYcQk6Tui4cNi1Xq0vFQ
         cWbCKG7g9RE8jqbFDdMzGVyaca82NBEueadZo6VYYw2RE9ie9Fp0wqWRy9+9Xbq1QcGv
         ynTiP4DCEwMZgKxdsJ+ADiJz8M9WZ/NndZtZ28D92FvQ7Z4HBdw8EgvobK65Gkyy1uw1
         IKC2evKojCe3NnvgZ2wJ3HbOuhD9rIIrYuzOQwyYjAnXz21f8lT81RMwV1VW+I3ptqFi
         TrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830236; x=1783435036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bh8SlCTfNpOE7sOPuwSI5J0e39QVe4ueR4PAofbIuas=;
        b=m32N6canQsk8fgR/tgtUwj4IJoy0iveOkB+FF3PONgzTjrEcUM9xCglqRhbUKnK5qk
         Z7eMNS8ZHVUtI3d1wscAHRnPgM47jDS5+NqxOQPAo4SgFRpECFcIhpe8y58Il5mqJmzC
         tztNPPY4wGgRbCKsSUPzKsaC/rGQto2Ybk6HyJgK52oT5rliIscjji9GH/Pe3FYidJiq
         274RLW3vSXnQWQDXhtsqTzEmRqhcZAA1kCIDj//OmX8FHrysPUW91UNHtHInKnorxNKf
         9MViBGXtR4bwrUzqCMNSXUPriQeiUo0HT4mpjKBLiTQ5KHDBnoMMEkrjSwIuCkxAXF9w
         LFww==
X-Forwarded-Encrypted: i=1; AHgh+RoJefQfbyZpDSKP4fcAnhW2sHNU6JMAlQq9bCplkf+CRCO1XOmKMFvsS3YpeRdhhButy7hI/PO+tqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz3awb0bUwovamdtgQpcVHsciDErbUAIpeGLeIjxnMDRI7kXTd
	qP+9PIFEqCo7Idgl+mywpdCl7yaw9E/4kjU6mtAISyt9fQfmfVA4FjOVo+KlEfAVxaCQ8QHEbGQ
	exqzbjkAaniHZtQFQdG3qtbE5laa53sFiHRB5sNaclI7bHXVZr0oi0t8McGYUOoU=
X-Gm-Gg: AfdE7cn+cjdoaA2jLhPchG9aZoWaUoJznp6yv2XSO7KZLO5zZyZbq7dB1gvzDlKM5b6
	TZRytgPHo2+7IcnrZE1LaAnAdGkRXxWVMoADo9iF0yvXsTLolwL5rc9Vvw2CWcD3P11nmlNklQu
	3ni3WZDx/HDH3GHWsrQ7wvaVhH3xPFPN7tcKbQcnxlLPuTCqhgx+1uGtJOUIB90uso6spSrzI2d
	KHrJVzUUAkzBazhqDkeB5rHnteiNWok3MRyJprPDOsGgwIaRlVtDpxWtR1IavbNlvZqj0H4I1I0
	5006C8GAr7ws1uyB3MzzlAFb2cCF+aoT93yAkzcC61P2ifIjNvzllVXZxn0JG8Z7oNQnKZi0XBG
	jRYOtD6vO2DSHlzQ/7FgHD9p4exVD4HFpIi4=
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr637521137.0.1782830236055;
        Tue, 30 Jun 2026 07:37:16 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:737:9003:ac52 with SMTP id ada2fe7eead31-73a333d61b9mr637518137.0.1782830235630;
        Tue, 30 Jun 2026 07:37:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c93cbf8sm1373390a12.17.2026.06.30.07.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 07:37:14 -0700 (PDT)
Message-ID: <798d2516-0772-4f98-8fad-959a1daf71bc@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 16:37:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT
 from byte_div_clk_src dividers
To: Brian Masney <bmasney@redhat.com>
Cc: Pengyu Luo <mitltlatltl@gmail.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        White Lewis <liu224806@gmail.com>, Maxime Ripard <mripard@kernel.org>
References: <20260303115550.9279-1-mitltlatltl@gmail.com>
 <d2cdaa7e-1a17-4e6b-879d-266844958410@oss.qualcomm.com>
 <aahGtIkxtNPeeWKc@redhat.com>
 <CAH2e8h5oHvaADPgE_GdPQsWrU00XUT1d0ktbE25ztMeBEE51Yw@mail.gmail.com>
 <CABx5tqJ_spoZrhX7n91rTOaMcp1G_n8jB5aJV-rNbSPYZBZxEA@mail.gmail.com>
 <abRBT4niX2CB9XVR@redhat.com>
 <22a469ef-0a25-48f6-bdc7-95ae5541e834@oss.qualcomm.com>
 <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABx5tqK3MymYQZ4owofnzFLnjt+96njw5RG2Vwxo7UJ93A-42g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX7i3P53B0aL7E
 9M16fSvwHESh8/WmFs1sVV6FBMwF0tje0Dt8cjd+MHWRHAJPeslw/apLbn3+qvvAP8UIHRF8OhD
 y05p/peS058t58vj8uQ0NUWUAEH7dcE=
X-Proofpoint-ORIG-GUID: k3KUWuvPyYTVo-drLi3VsXEbhsSx3Bay
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43d49d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8
 a=vTfNKC5RNyR7SVgzpBIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzNyBTYWx0ZWRfX4FqmCOs/u+C6
 +W2ZWH7/b+uuxrByALOjqs7LtU7HbQijCQbrLCa0ZHu7gg1iaeDS4g6SiQ8pstzEUb6HZsB0rez
 cTmAOXMM3Y19LYRXkctAeEfeCjrmg7+uK9AOdTecmcAKqdwVwMdZWIIXOMDuW9L5Vw/ijVqhYws
 Hg92aOVeS0N4IibLBH5zheHH3qxSAMnLfLzJbUrANEfiC7YS1y1TD+GZPsvaBsnfrdEPvLa8J/s
 7gVmlUZV/UP6ypuHJVnhCzYmUaIeVkhkH4f2WSnA0pOp6s/R/hApQ5j/u4Ss7eu1l+rV/VBywTR
 GGi8g7mMNb/qjzdPR15/ZEMOwnMqGdCM+8FKjZCct+SIPNSCqIisMvxJi2gMVxu1HCMyUQkx4QD
 tY0LiWZTI8GL3E+0YR2wWXBIpfCbetkH8shyLVrR3GrPj+Iwzjh8G1/9g+woG/116nb689KNwmp
 W6KmesOYQ9ZhEzZJr7A==
X-Proofpoint-GUID: k3KUWuvPyYTVo-drLi3VsXEbhsSx3Bay
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300137

On 3/23/26 5:07 PM, Brian Masney wrote:
> Hi Konrad,
> 
> On Mon, Mar 23, 2026 at 8:48 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 3/13/26 5:54 PM, Brian Masney wrote:
>>> On Fri, Mar 06, 2026 at 06:27:20PM -0500, Brian Masney wrote:
>>>> On Wed, Mar 4, 2026 at 10:08 AM Pengyu Luo <mitltlatltl@gmail.com> wrote:
>>>>> On Wed, Mar 4, 2026 at 10:50 PM Brian Masney <bmasney@redhat.com> wrote:
>>>>>> On Tue, Mar 03, 2026 at 01:10:43PM +0100, Konrad Dybcio wrote:
>>>>>>> On 3/3/26 12:55 PM, Pengyu Luo wrote:
>>
>> [...]
>>
>>> Ignore my previous patch set. In my v6 that I just posted, I updated
>>> clk-divider.c to support the new v2 clk negotiation logic. The
>>> clk_regmap_div_ops uses this driver, so you shouldn't have to make any
>>> code changes.
>>>
>>> Anyways, would someone from Qualcomm be willing to test this? The
>>> procedure is fairly simple:
>>
>> Unfortunately, I don't think it's easy to get your hands on a 8280
>> device with DSI.. maybe Pengyu could test that on his tablet/laptop.
> 
> It doesn't have to be an 8280 SoC. It could be any device that has the
> issue where the parent rate change screws up that portion of the clock
> tree, and crashes the device. This has been a long-standing issue in
> the clk framework.  I know you recently posted a series for 5 other
> SoCs with a similar change [1], so any of those other devices should
> work as well.
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260304-topic-dsi_byte_fixup-v1-0-b79b29f83176@oss.qualcomm.com/
> 
> The kunit tests in my clk scaling patch set demonstrate the issues
> that I have worked on. For example, in my test scenario, I start with
> a parent, and two children. The parent can do any rate. The two
> children are simple dividers. This is the current behavior today:
> 
>         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->parent_clk), 24 * HZ_PER_MHZ);
>         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child1_clk), 24 * HZ_PER_MHZ);
>         KUNIT_ASSERT_EQ(test, clk_get_rate(ctx->child2_clk), 24 * HZ_PER_MHZ);
> 
>         ret = clk_set_rate(ctx->child1_clk, 32 * HZ_PER_MHZ);
> 
>         /*
>          * The last sibling rate change is the one that was successful, and
>          * wins. The parent, and two children are all changed to 32 MHz.
>          */
>         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), 32 * HZ_PER_MHZ);
>         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), 32 * HZ_PER_MHZ);
>         KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), 32 * HZ_PER_MHZ);
> 
> With my changes, the clk framework will land on 96 MHz for the parent,
> and 24 MHz and 32 MHz for the two children.
> 
> Anyways, it would be great if someone from Qualcomm would be willing
> to help me test my changes on real hardware. If it requires code
> changes to a specific clk provider, then I'm willing to also do that
> work if someone can test for me. Getting confirmation that this is
> fixed on real hardware will help to land my series that will provide a
> solution to this problem that has existing in the clk framework since
> it was introduced over 12 years ago.

Was going through my inbox - do you still need the testing? I see that
the last revision of the series (v6) is from march

Do I need anything other than just the series itself?

Konrad
