Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4658E374E7F
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824817; cv=none; b=gjUp23GLAjErNk4Wlfh4BlmwvL3nwmPugVmF+aRuJ2NelsTo0L2jfx7KihryE8qyvjb3piQDyUct4qgxNb0bQXnu6v8ZhIyT38LbVXhQ6n7AxUDydvj6byhBdAOkNXnOgSyKz9yO6L18W01bONFGHVgE73pgKLRb4gL0xcM3Efo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824817; c=relaxed/simple;
	bh=89xsqU4N/16DllPbCM+QgiZcRJvl/c4DSF46VkWkHuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OEkLhDSA30KPxWd/XXA3ixtCn4bBd0VPdy1Ah8PgilIuMUHzTRXOnehQPxdJjLswfTGhyqyHiQseL6rCmgrkKLdsf1UleMFFGowUmbJG8S+WGeBy6KeW1tX77uQCmPK8dPqwMJFbP/eXBxetNB1Oc47KYvDaa/Zyo7Ds5MhAsKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cWCI7S9z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVJEiC3n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cWCI7S9z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVJEiC3n"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvtAA021495
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 16:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lk89yAHBTKggkrt0bGV2u4rtt4D0N+23FXFRfMG2ZEQ=; b=cWCI7S9zt7D3hu+q
	C+H0WcoEH6uvbsZ6BV6RyI7kjtUV4ajDxRWoV09mVQow+M2zxc/wxGJLzjcajsoQ
	Hwo4caCngxPV/ftgpHO2i4Qws0iO6hmM4S7n7xpWR4XaI/qAeNFDldpnOHd/W2d4
	r/W2BNfbHq3wrOID3Gx8ka4msjaY41vpd7PaaSCIuI17+ayzpRmp2nokyUxleZiw
	XoUz7Kq6MHgTcnlW5tNHMt8sE/3zX+8Y5KTS3w9oB4CoZrOESeqeJLTwb51wsK88
	KvGh/cDh7iI1wL0aDKLH+LNYxkpE5MgxyKR9SfcG7tjslmGiKYa4szlCg/xV5QW2
	hSvIXA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7m7ev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 16:40:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9c26587e67so685201a12.0
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784824813; x=1785429613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lk89yAHBTKggkrt0bGV2u4rtt4D0N+23FXFRfMG2ZEQ=;
        b=JVJEiC3nGUcudoU3+FUMJEnDf47L+MvSM+ClQj375P212o+gxrnTe3sVTcMAvAGsVj
         t3fkUrl0OQGkoaPRDFKD1uqK6cwUUznBQ6mJLF9iU6Y7BLrazPpZk8v62vLUroirfuuo
         KLQCkMjAAZwhn3gY2+KplN57aBvSWNtg/n/z0JUrtWhEhiXhzXhlrOJpmDB30N45R7Mz
         EOOHJuJpTlicrvuHU1Gag9arXiaEeBT6SgEiYGPV5JHiyupYg6S4fuZVwdUYpLFUaCOJ
         aweOpyObeS3EoDDOrrVxf7dUy9xgBF+dl427yfucro6npii3Bg9izGiAdpvMaTVoDT9/
         5Gjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824813; x=1785429613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lk89yAHBTKggkrt0bGV2u4rtt4D0N+23FXFRfMG2ZEQ=;
        b=Ken8/ThrCNjJv+0Br2yMj1o/Y88MymrP1SjIK5taygtjBnAEiwQqLXKl6EJjLS0D9u
         IsR+JPWyHc2MJ/xP435HGnJquuGnZuZJ4WsC3OJIACdrwAuhJNoUazlMCn8Q1G2MOi60
         L5zIphHAFVmaHvJjDLFDyvThoSHpIVnLnLXhu9X8DfMlnpjZav5zm4G5z6OENeZJ+LAp
         QwkFt4Z8sFYF1yAQUCW2nrciDDRkGvPgxdmh3Ez0utNH0CaBUaJZoWV6OR7sYfwGjg9I
         JHEWM0yvy+0UxgMnEVwjuxPNJInRaoaJfkAV7t/XMsW4rgxrmNcKfPwQFMuNCRWcDVH8
         0FXA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4lNlDOCPnj948qHyZWNau533Pg8Yg7ZhrZDprZkN8qW/u0SpD2Ol0xuQA09mUIDNRdEFXIVYsGmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtMLvAVf7xDbs4Erg3lHf4MLwv3jD0m9afsOnX34TTPvl2rn7E
	NdlqmJ409jNLvgitKNTHMg29Q/8l251h6kOk8WHO0i/1E69DcUvwjbWS6hFrl5g0skvHKjMbQUO
	GRluzIZlOm+t3mQBheo5dSxgdmOcmWCFAAMu8CudqeDqu9R1wD+QXfYghaH1sF70=
X-Gm-Gg: AR+sD11dDEgFicL42WfWJ8pG+wfclRqijIdFAYtRGoinaYj97PjQUd7HQ+wnnlunzsD
	dny0FWI4ro5bl9m+KVkMKeV3XNl6bCEq2sViiMQacWvx6F79RgXwIrwZ5lWYtgRAceIZAjErv7u
	mb2OS87qLV6ynccBWjQtKN6g6sN2RSWyVYXkX2SN7E2vOkNm+/zThp9GwtMugf4GixpdLUpefug
	ZpoqMPwuaa0qNuwoun34HklwhCkLXD3dw8t/1VZVnC/5aXnIYarzezI9pOd3xcgicuxrsna9Gf2
	lAnC65UuoxNz3PMlC252uqo59BtbAjhjvp0ZUk4VuB6SIcE4xosoyC+lmq9aDATcGJLzgUcCaNL
	FxoxXlAHMF13yA7QSNDkhBdJ01JpsLNIw
X-Received: by 2002:a17:90b:2e46:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-38ec841fd7emr3114812a91.9.1784824812489;
        Thu, 23 Jul 2026 09:40:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2e46:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-38ec841fd7emr3114762a91.9.1784824811728;
        Thu, 23 Jul 2026 09:40:11 -0700 (PDT)
Received: from [192.168.0.5] ([49.204.109.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm28488722c88.15.2026.07.23.09.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 09:40:11 -0700 (PDT)
Message-ID: <bbea2bd8-adf9-497d-a159-1871aaa9cce3@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 22:10:06 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Guard clk_round_rate() against error pointers
To: Brian Masney <bmasney@redhat.com>
Cc: bjorn.andersson@oss.qualcomm.com,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        mukesh.savaliya@oss.qualcomm.com, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, chandana.chiluveru@oss.qualcomm.com
References: <20260723-fix_ptr_check_on_clk-v1-1-568a7ed87746@oss.qualcomm.com>
 <amIlYNjWeJQ9tcOB@redhat.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <amIlYNjWeJQ9tcOB@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CvRT9lztjLrkmKRdKMZCpHNejFtpp8Yj
X-Proofpoint-ORIG-GUID: CvRT9lztjLrkmKRdKMZCpHNejFtpp8Yj
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a6243ed cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ki/9DncYKtdbYI9tCPo7qA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5vk8l6TQ9dB8fbFmZYYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfX2AfgsIHNXiNI
 8bmxkrviCEaPlc6ZnBVqgIDDTdOJdv4c7kw5NgP1vciKiUyyABBrrmLlQiX0ociAHtiEvdyB5kh
 vbGe57gMMWOcpU2mkyMn1O9ebmQbjlE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2MyBTYWx0ZWRfXxSPd9vbBZZ+x
 Nr1fnHRRzNJ7qTojywtgdk1dtF736xzRSRsgNQhh0Rt5SsTX9b6m8WZSjj8XzXj/dd3rBdfWA+k
 Dx1YToKxZzacbUXmtiIzWfTzEWfRPrvKc4lGYp9kFmo4DpxjfnX+AXPseqfuMtnAGq0t+sztqkD
 QY0LitIaY77zPi2zgm9n8ACjAknG11ufRZ95Gf/Nl+7lVbR4KKpn6HEgo7Mcy4RoawDfdo7y17n
 XYc6iwfy/FrjUnQ0tFhdrt3g5Cqvjws8ysOxFDIpwSL3JF1rLOcJCnvhFFimDbsz2XmW9C5hnd4
 k8b6C1Z9lvxNIkAyB63H3Q+7sVeyeLvTdId/UbNLBYULutIAMcpWqFn5QXSMEu8sHSNWp6IfP8f
 WazVgCI2K7FsJkjdvPUhpt/5k/T6lWLMiwi+cU7/RVcmoeQXOGPbiRRhhHYVnbxCbv027gVJTV0
 NBHckIeXyRhCY6eNRrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230163

Hi Brian,

On 23-07-2026 19:59, Brian Masney wrote:
> Hi Praveen,
>
> On Thu, Jul 23, 2026 at 11:40:47AM +0530, Praveen Talari wrote:
>> clk_round_rate() only checks for a NULL clk pointer before
>> dereferencing it, but callers such as dev_pm_opp_set_rate() can pass
>> it an error pointer (e.g. ERR_PTR(-ENOENT) left behind by
>> clk_get() when a device has no Linux clock and is instead managed by
>> firmware via a genpd/OPP performance domain).
>>
>> Dereferencing that error pointer to read clk->exclusive_count
>> crashes with an unhandled kernel NULL pointer dereference, since
>> ERR_PTR(-ENOENT) plus the field's offset lands on a small, unmapped
>> address:
>>
>>    Unable to handle kernel NULL pointer dereference at virtual
>>    address 000000000000002e
>>    ...
>>    pc : clk_round_rate+0x3c/0x188
>>    ...
>>    Call trace:
>>     clk_round_rate+0x3c/0x188 (P)
>>     dev_pm_opp_set_rate+0x114/0x33c
>>
>> Change the guard from "if (!clk)" to "if (IS_ERR_OR_NULL(clk))",
>> matching the pattern already used by other clk consumer API
>> functions such as clk_unprepare(), so an error pointer is rejected
>> the same way a NULL pointer is.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
>>   drivers/clk/clk.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
>> index 048adfa86a5d..8c1ad3d10284 100644
>> --- a/drivers/clk/clk.c
>> +++ b/drivers/clk/clk.c
>> @@ -1780,7 +1780,7 @@ long clk_round_rate(struct clk *clk, unsigned long rate)
>>   	struct clk_rate_request req;
>>   	int ret;
>>   
>> -	if (!clk)
>> +	if (IS_ERR_OR_NULL(clk))
> Can you provide more details about the clk_get() call point that starts this
> error? Specifically which driver this occurs in and the exact scenario that
> triggers this.

On SA8255P platform there is no Linux
clock for the SE, and the perf domain device's OPPs are populated entirely
from firmware via devm_pm_opp_of_add_table() (through
of_genpd_add_provider_simple()/onecell()), so the perf domain's OPP table
has entries even though no clk_get() ever succeeds for it.

The clk_get(-ENOENT) case comes from _update_opp_table_clk() in
drivers/opp/core.c:

     opp_table->clk = clk_get(dev, NULL);
     ret = PTR_ERR_OR_ZERO(opp_table->clk);
     ...
     if (ret == -ENOENT) {
         /* ... no clk provided ... */
         opp_table->clk_count = 1;
         return opp_table;   /* opp_table->clk left as ERR_PTR(-ENOENT) */
     }

Because the perf domain device has no "clocks" property (its OPPs are
supplied purely as performance states by firmware/genpd), clk_get()
returns -ENOENT, and opp_table->clk is left holding that error pointer
rather than being reset to NULL.


Praveen

>
> Brian
>
