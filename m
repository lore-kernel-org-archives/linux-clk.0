Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B90254938D
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987663; cv=none; b=srLThfFULsDd5xMSvLAlwJjIGCt9e2BGk6Is1l1Y8LLLLGpwcGbvQ2IZxhuouSKJ76yrtwB+xQXwrvzLgfudZfnkC0p74XseVTI5Q2SIA5it5KmmSj5ne61v8he8iwpSHBOAsYPd2064tCDAZyNP2+nTn7FMf0IYGMUrz7z9njU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987663; c=relaxed/simple;
	bh=XGNrFoZ7MV8C7/dY+VSILAwCYiTvCmyJQJRuuRE54UA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o+gVMwEVENlBm5FuFeP69MFIDfHrS2w68Wmu749U547IFWsC1NxMcN75GJEem4V8IOYwebPzOhX/lZAxqROOZP8P/pgjmlUNChmghr4obPTYJwcPTj3uhLPT/hBkNih4mH0EXKIiTpHYD7H/Ob6dTtnfJZfUY2V2KBQkANjCg1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XQsQ3V2+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zmxg4MYK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XQsQ3V2+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zmxg4MYK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eBfp3696121
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=; b=XQsQ3V2+7aeVELol
	Ty82a8+AuF1t9jlkHQFWPGqV0R1T/GK+hcYNI/jB/xE2U98nVKQjh5LTXxgH9Z/p
	vXORGa0AWtbQzyGpze8vXqeSkm/EQSTQUBEDHb4PIce784LMrvhQQisXC/+VrQg1
	uqEXXg1kM64HJJ0Vb6vywpDypIJZ+5ofYbMUUCa6vkaVMV+zhIRGXm+OyNQMYJmA
	tdBDVH3qrmhCc5rDyyGwV2XdSDQ5DWw1QXD1+5F3vt9ggiq/cVRAAQ17B2qEVMLj
	3RbBcP91MMTjRXH7h8bYm0/ezdrYQmBFfkFgDhiK2OgCf5/fzf4oytw483Dyw4iM
	FYpRpg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeh2s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:21:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e95e7cc02fso76253e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791987661; x=1792592461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=Zmxg4MYKo/Vf6BpjiGU32+iH9JlFOnChl47qhzzUDhEgDct83FrAbY791yHTDWU4B/
         e04244XRbbCnLs7tCWGWqhIL1DQtDFeMBRfMn95judfW6WDkKlUFfDPUbWK28Vj2rHhe
         7exrpbRzX48U67+Bgzde1uZwS6veljbuJ1jLgW0IrTOuDkrsV76AbxehFBfP7WEMfBj/
         PQExJpjE7N7X0odTjCZxRyp0c7uwDCHN7T9WphZGrpGp0W7fAmqngr9/+90JqgjQYWr2
         DRDuOKHLEQlU/VOfHbkPqkfu2GuPEcbONX26w35YmXiwH81BymGzIjHP5uyrk3MpYdai
         iGSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791987661; x=1792592461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guDtRT+BFrNgrMr9QvoZtjIgkyZewpK+lc9ir5W7b48=;
        b=H/PE4Sf3/6wh37m5ZNx66FSVbGQpz9udEpGmPBGLepZVY1twIRm/sHA3OOBa/J4Sji
         c188sg9nen/fyJLWeUd2XUA3BCBOJB3gD8NuYjTlIMDqMQ5k4ChAZ2EFNDPsF3dc/2JY
         RZsE2I3pKVuqX8zp9a5YtBL82GVWCfTPIAKMjD2TYNZY6OBPuKmAdtM0ZKoc9JFNHB78
         8avDZp+dPjSlefGv7WZxYvIhGQ6yNlcc4pc+x68WRQVmYTzBawUEPQ+5CjGz88KyIZMU
         rlCT9JGWEsGuCxuTpJxpuxVBR02phjHqvRU6AmEwB7m8eQ3JfU7i5pUXVAIJXtiZnPUI
         KMDw==
X-Forwarded-Encrypted: i=1; AKwUvBy6pLZmQB2KBWFjuicYJC8fXLVHJ9HBEgVtOJdJv/MutXKNY71nOnnyBWX5p4T3HkIO15kwmYvoP/A=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+eZosiN8IqCEsQQdhDqWWqaD9jNaC+TK5wNf3LQtNzcKc0TVi
	/epOwPnpBtZAxgMOqb/1rEYMqAoHUz9WXLqpQD1YS+IPccYvCbArjkoZMRgSxM2iP5PzDEXXZQU
	O8HUgN7U9UiIsgTebRthkzOrcVRuwe4w7wcOEn6mj6bQk5qBo8Ydx8X9aAxFfVyo=
X-Gm-Gg: AYBFou3s9i6BvN8CCZc8znwVqtmDdpUNOGVGNNQW6R/NFdF5RpXge690Ybd5Mk/LIZq
	83mpGzzArWD4C1MXK6ZpRHEYlMKeB8tXkQLqozZjeeq0/6TJMYU8hJsi2IdOjknok9U+CJRVd1W
	jDMQW12kF8VWL3JCcgx8Ehv5s2tZHpqVLrLhzVTGVxeML1R4fsAECZFfIJQJfhNRFpo6H/82oc8
	+x8UdqJuSuxgKVfFctzVX7cGU2fZs2WbHbJ8suG4vzbCwqS+ZYyZpC+fM7CqjeGd5c/YA5YHkAD
	7kh9rx90OQA0JozL6m5ErhHSMss9xOKVkZjvt2v23vobsAtXWyeK88Da2Ur5TspsPgVlwkj1TWi
	BpqM2W3VdWc5zxcpWqWst9w==
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157604e0c.3.1791987660472;
        Wed, 14 Oct 2026 07:21:00 -0700 (PDT)
X-Received: by 2002:a05:6122:4a0f:20b0:5ce:bde0:9b53 with SMTP id 71dfb90a1353d-5e91f49ed42mr3157584e0c.3.1791987659925;
        Wed, 14 Oct 2026 07:20:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388ad72sm1182036a12.24.2026.10.14.07.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 07:20:57 -0700 (PDT)
Message-ID: <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 16:20:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: F7gmPGod2qaL7So4dC3oyOrPXokGOsul
X-Proofpoint-GUID: F7gmPGod2qaL7So4dC3oyOrPXokGOsul
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX1YbLInU2wQUx
 fGw7KBoPOB4olnHtegBcvbhYkI3RlyD8dp9Xs4XFkR7S+VlDocQ6/8FQHRayRdKsrVaZnV0OZgJ
 0tGjVIbmirD3IXZbSvWPfcAtSVpyt0I=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf8fcd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=NbljYO6N7a6c2dGYBmcA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX4GqXoQiuFsk1
 5CEpdN1bcVFlLZ1OyXiATFMmspHAQ03kxg43MAGt4UuP/jSmf7izFcazzF+seB4s/3JUmOfds43
 wpI9L2AguaNBnMbLdO9jI7HKBwKwnCiHdOvofeEhhFp40CfzUtyhiKxXn1VtT043QFa4FRCD1R6
 MjcZr/8rqqDg4hni6JU9re4es5U/uytbVsNU1dzeWVkvww4e64UiIoQHHtKwOptf2ataiqyzwXu
 j1ws+cv+l7CIfb+EEbW/S8MRvvjf8FN64tPNo1QRfEDgqn6PTPDVraSrQP8ydur7+dByiFjzLqO
 fcJKa88zwrgkrzKd66Zkl/vfFBlj1NsgMKlKJSsU5emLAfugasL5aDo2gMJ011tyTKSfoz1KEgf
 4EzXXPzxXLGN9RUWTtiQ7mz5f6KrfLiIlRyT389EoU7YoeZBN7OAEnmWTJQWLHFWc1IRQZTbeqU
 DijRm0cIOI8uYUpNPyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140057

On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Clock controller power-domain attachments currently become parents of all
>> top-level GDSCs exported by that controller. This conflates resources
>> needed to access or operate the controller with actual power-collapse
>> hierarchy.
>>
>> Allow callers of gdsc_register() to suppress parents inferred from the
>> controller device and its attached domain list.
> 
> I think, each GDSC has a parent (in the hardware). If we don't represent
> it in practice, we likely need to fix that.

The next patch allows setting a precise set of parents instead. Perhaps
this commit message could be improved.

Konrad
