Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E143A6F1A
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 10:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783335513; cv=none; b=t7bIkvzMuCBP6l5b1r+SGWd1vZo6Z600bxo48/Y/kJfuxaHquJ5bjnOw6LeYJt3ly1NvlDrNFxXT4cAUSAEBxxjHF8mfgWI7Kq+hMz6l+kZHe6bnsYZwOXBA4AVBo/a8seqK1e5wHgdIstABxV8wdvOWkZsIkC19OZlJUoGHjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783335513; c=relaxed/simple;
	bh=EKx2jOVEh7Yas0Q0NWiBgP6kO/9BGTfaMxWxpDPONsM=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=sIYJS7dr5Blqvt27YSXJDy8LMmxY4Eajl+7YhxqgXipmMCHgIgLf0cEIFp2FzqFuPG4a45v/D9bka4pjmNaTyBxJ4eaasV1U6eX6AY6GEerhox96bIHD7Tyf3tDagrLyKINuvs/1Z7kyu0SfKKficLiNJAp+iYE3+1vduJhn6Dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nn1VysWg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMfMZdJn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nn1VysWg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMfMZdJn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693sjZ107432
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 10:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KyyE6lR5rSBsyyF5dE8TRdQl
	TxO5jRvW8cHP2PRANNU=; b=nn1VysWgbcgyuRlQhU2A/K8Sukr7qkYLB+zcLIVc
	ydR0QksPSocjF495toWHGUuHIsMmK09b+iz6gaOk3QHOZEfwsXPShXXYX8BTd6q8
	ownauOKg11/+1SyoKkUwHAY+Nsgf7HANuaSueyZg7rxFD1BTPHT55k3iGShmoZ13
	/2xn7MjytThc+BXJNiv5m3LGscTvzdOije7hMv+pZJ9s2vUYZmUwhN5iPY0wgxKj
	y5nUR+bh1ZbUTfUSIIiqQAwBGp4onvrTY719IHt9OPXGTNs20CzXiHHzgyeTtjSR
	7x0g2i11XLOeUsRpg50wButpy5NT5ZCdPSpyqnt6dCld/Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urh07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 10:58:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf9df2eabso1860371cf.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783335509; x=1783940309; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KyyE6lR5rSBsyyF5dE8TRdQlTxO5jRvW8cHP2PRANNU=;
        b=gMfMZdJnU6AEUPq2HKUFXfxOe9btbydb4FKj8BNuHOzQZL+c42o74ntNuF4xxicDg4
         dHfebi/w1vM2UNgbvnjJIDa70JdgDXq8wyRcO3g2bnZuBHQuovGp3Wn3AuH73z1gPvkT
         RRHGBczq1CspusxybaUxteVAeQ01VY7Pt+29qey7igkfMKPXw5rZIXtwKaFUHxVd3kw2
         SQdpHLQcwIjiBqicRFI7SVahcwuPAP5TXSvW5V/Kd+mG2uPX9KtifJ2LDeZFGPt6vpJx
         D6NBtSYO7p3/ccs1vlZ1i5aNcutdKf2246i0klX/ZF5GE6h2WABxQXOltMoCiTQFODT1
         0pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783335509; x=1783940309;
        h=in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KyyE6lR5rSBsyyF5dE8TRdQlTxO5jRvW8cHP2PRANNU=;
        b=P1oG0m/8FnFQOuMb5t/JUtYz9rkspkY4U++ZMWA8rVqgmfJoossvyXLmxNL88T9ri1
         bmPZspUAUDDG4gcHEJGG1mWRJh/imlmV0wXwus4bR/Wm3AjQkrKq1TQfmkjmuzmnozNW
         98Wj1Covl2coT/jDiFnLw17M4IQ2f03eYUvx3YY5IP1DyB/ZmXuLwRxjrLYNuL6wwZrJ
         GCv69nmSqLVgvcDc4WM/Fa7UKJWROpyvk9ivxGIt+B0HBqKskgnMZIFt4CfuM1KAugEF
         AOTePEpav1iidErAkLF9YrbZ8J+/kb3kgg4IoPDLDW0J+Sifouy27R1zqC2MYW4RTiZy
         dKYw==
X-Forwarded-Encrypted: i=1; AHgh+RrufWHnbf0TUM9xP9SwZ97uHQxKIW3e6OlA0huE8G1x7hQv6AxKVBUu8jZzxHHwFVR7F2qaFOZst+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlCFej3goD82dli0YkQoPMyuj1nosQET88qgrBJmQgM6NtOYS6
	4B0+GAp5Azq3hAhzwbq0Bgyv5teBRebFvZGiQvVf58+JWLdE2rX4jl3zQ4JHFBFpzxbQMdLkfpj
	/hKgAPvaI6y3Q1EcrXp7tIvK6iUeT/7qqfF6/XwOSDCRVhd3ENuuXWTc2pV3OSZs=
X-Gm-Gg: AfdE7cmXmDvnQfzZOSZwGdFwdOJjJcHtUM2O9GPAg1/4DXZbNTXKsdkVXhljuT9SRqG
	1ldZnnigdW7P986kSPzGTxl98LYU5e1EFLxPS/GMM6vXu1T/W+BCrxML1KD6MqqGslV4WO/tlps
	SK3sYc2djDbgM2e0F8htsIMbGP3nZCMAitYlNZHN0jfSM23ZjpxtNhOeubinZ5MuhW2VTaOzkx8
	oFDLbPI/MC9S+hCf+fwfzEMnbuX3B9E0cbGReq1GdTDYmhMPJJfoBptM+tK7eVBArbimS8PRUNa
	l9yz5OYc2z2u4hR3b5mX/yEHtRPvTTtqYW3pFVAYnpyBlSz+z7g9wPocLdkSfGlqBvQsPzsajhz
	WUyVobL7AD/MWD36hjYefRwxrg6jgVmquGN0=
X-Received: by 2002:ac8:7f85:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c4bed68bamr96136061cf.8.1783335509088;
        Mon, 06 Jul 2026 03:58:29 -0700 (PDT)
X-Received: by 2002:ac8:7f85:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-51c4bed68bamr96135961cf.8.1783335508649;
        Mon, 06 Jul 2026 03:58:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm718125066b.56.2026.07.06.03.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 03:58:27 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------WrS03HCPds46SoHgGJvJqrD1"
Message-ID: <48a406d4-0033-4538-a9bb-75ccc4897a3a@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 12:58:24 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: qcom: hfpll: return lock timeout from enable
 paths
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Herman van Hazendonk <github.com@herrie.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260623060517.10889-1-pengpeng@iscas.ac.cn>
 <8e7a4cd1-ff17-4052-938b-5cb2ee8576f0@oss.qualcomm.com>
 <36f37fa0-94f3-498b-86ca-b431436750e1@smankusors.com>
 <198ad9ab-6e8e-4c67-afc2-01962ea12dde@oss.qualcomm.com>
 <5c374231-33dc-4082-95c1-1046286fbb13@smankusors.com>
 <89c53cb1-3804-4dfe-8d93-e27e31bc2254@oss.qualcomm.com>
 <42fa946b-43f7-4f8a-a349-f8509daab749@smankusors.com>
 <e129178c-6079-4538-89a2-247185dd0ce7@oss.qualcomm.com>
 <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f1749c0a-bb54-4ddd-94cb-75af9386a47a@smankusors.com>
X-Proofpoint-GUID: ghDGHpjIB0ZGD0ATLk29IcxQhS_fHgrw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMCBTYWx0ZWRfX6k6UmahlijtX
 4DpXsYlbvq/lTNgUNMNg7ZL6DPp5crUlfC4ZV9DR5B6gqjo6wXlIBYSrhbgHRAmgPIDonVKBMJ8
 EtaP6bqjx0SEr9mG+F4wtOJbpg8Azfo=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b8a56 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=dLaTv87jCI_4qPz01CEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=tUYcLeRNXNVrObFpOFIA:9 a=B2y7HmGcmWMA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMCBTYWx0ZWRfXzARYEk0HYwuw
 S7AnGQ47ycMvgTv1EI/2PMvRddOELqATt8Iao83Oh7Qmh783QCDF/FP0N4OuBX2vpZx3EQvdNTb
 e7G5h1rs0njX+OnUdK2N1s+VSDsTzA0fvoEIH5JWFHSvgUCVmzs0ZPIrm1+a1TrReCAjj+Lc8iP
 VJUi/l8Dosv2u/8F8nC3OsjTzOhkaWnnaMSyNDO6aww4sG2KeyVeyEhnBbyJwPU3+RDhYLgTcW/
 zolCQ1v7Y5SeKdhDmglMRW3xyLs8Z5sMHm2b/VBUleOLeogNNbo+ZHntZaHIcukQIcMRbQDPXSV
 9RDsiO/30hKhaBSHDyhIaLaiJQUox7YhYSzFLQjuVmUo0gmix9r8iNv7D9ydFIXfZoJonOD82AS
 4sJ7CXnHvo0tpaEBfxBJUGH3fNv3WT+ABDwk6zccK65Vw6kLgGYyVdSWTLT2ONN0j5wWfKLhyIx
 DYZDBouy1skZcSHz5gA==
X-Proofpoint-ORIG-GUID: ghDGHpjIB0ZGD0ATLk29IcxQhS_fHgrw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060110

This is a multi-part message in MIME format.
--------------WrS03HCPds46SoHgGJvJqrD1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 7/4/26 11:02 AM, Antony Kurniawan Soemardi wrote:

[...]

>>>>>> Seems that way - cpu, L2, and GPU, maybe others
>>>>>
>>>>> nope, tested on Sony Xperia SP (MSM8960T), the phone hangs
>>>>
>>>> [...]
>>>>
>>>>> [    2.679716] L2 @ Undefined rate. Forcing new rate
>>>>
>>>> This seems odd. What's the reported rate there?
>>>
>>> if you're asking clk_get_rate(clks[l2_mux]), it's 0 Hz.
>>
>> Hm, are the parents registered?
> 
> pardon me for stupid question, but how do I verify the parent
> registration?

Parents are just other locks that happen to be specified in the
parent_data/parent_names field of this L2 clock.

For checking if they're registered at all, you can check if they're
present in the debugfs summary I mentioned (they would also have their
own directory in /sys/kernel/debug/clk). For checking if they're
registered at some specific point in time, you could hack in a
clk_get() and null-check it

[...]

> Do you have other idea how to solve this? I added some pr_err if the
> read poll is timeout:
> 
> [   11.164436] [pmOS-rd]:   ❬❬ PMOS STAGE 2 ❭❭
> [   20.400232] krait_add_pri_mux: krait0_pri_mux, hfpll_name: hfpll0
> [   20.400793] Enabling HFPLL hfpll1
> [   20.455491] krait_add_pri_mux: krait1_pri_mux, hfpll_name: hfpll1
> [   20.456081] Enabling HFPLL hfpll_l2
> [   20.560623] HFPLL hfpll_l2 failed to lock (val=0x6, ret=-110, hd->lock_bit=0)
> [   20.758961] krait_add_pri_mux: krait_l2_pri_mux, hfpll_name: hfpll_l2

I noticed a bug (patch attached) in the enable function. I then realized
the patch from the OP also fixes it.

I then tried to validate that the code we have in Linux even checks the
right register.. Unfortunately because this SoC is so old, it's difficult
for me to find docs for it (and the register layout I have at hand isn't
itself enough to deduce some things), so that's inconclusive.

I then took to msm-3.x and lk sources, but they simply never check the
value of the status register, they just call udelay(60) with presumably
very high hopes and a lot of prayers..

Can you check the state of the gcc_base+0x3420 register before and after
the /* De-assert active-low PLL reset. */ line?

Konrad
--------------WrS03HCPds46SoHgGJvJqrD1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-clk-qcom-clk-hfpll-Fix-inverted-break-condition-in-..patch"
Content-Disposition: attachment;
 filename*0="0001-clk-qcom-clk-hfpll-Fix-inverted-break-condition-in-..pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA1YzY1YjI3OWFmY2M1M2E3YWZiZDYzZDc0M2UwNTZjYTAwYjI5OWEwIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBLb25yYWQgRHliY2lvIDxrb25yYWQuZHliY2lvQG9z
cy5xdWFsY29tbS5jb20+CkRhdGU6IE1vbiwgNiBKdWwgMjAyNiAxMjo0NjoyNCArMDIwMApT
dWJqZWN0OiBbUEFUQ0hdIGNsazogcWNvbTogY2xrLWhmcGxsOiBGaXggaW52ZXJ0ZWQgYnJl
YWsgY29uZGl0aW9uIGluIC5lbmFibGUKClRoZSBjb21taXQgcmVmZXJlbmNlZCBpbiB0aGUg
Rml4ZXMgdGFnIGRpZCBhd2F5IHdpdGggYW4gb3Blbi1jb2RlZAp3aGlsZS1sb29wLCByZXBs
YWNpbmcgaXQgd2l0aCBhIG5pY2VyIHdyYXBwZXIuCgpUaGUgc3ludGF4IG9mIHRoYXQgd3Jh
cHBlciBob3dldmVyLCBpbmNsdWRlcyBhICdicmVhayBjb25kaXRpb24nLApjb250cmFyeSB0
byB0aGUgd2hpbGUtbG9vcCB3aGljaCBleHBlY3RzIGEgJ2tlZXAgZ29pbmcgY29uZGl0aW9u
Jy4KCkFzIGEgcmVzdWx0LCByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoKSBpcyBsb29raW5n
IGZvciB0aGUgb3Bwb3NpdGUgb2YKdGhlIGRlc2lyZWQgY29uZGl0aW9uLiBGaXggdGhhdC4K
CkZpeGVzOiBmY2ZiZmUzNzNkNDEgKCJjbGs6IHFjb206IGNsay1oZnBsbDogdXNlIHBvbGxf
dGltZW91dCBtYWNybyIpClNpZ25lZC1vZmYtYnk6IEtvbnJhZCBEeWJjaW8gPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4KLS0tCiBkcml2ZXJzL2Nsay9xY29tL2Nsay1oZnBs
bC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvcWNvbS9jbGstaGZwbGwuYyBiL2RyaXZl
cnMvY2xrL3Fjb20vY2xrLWhmcGxsLmMKaW5kZXggNzA1MzUyYWZmMDY3Li42MmZiZjUxMTAw
M2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY2xrL3Fjb20vY2xrLWhmcGxsLmMKKysrIGIvZHJp
dmVycy9jbGsvcWNvbS9jbGstaGZwbGwuYwpAQCAtODIsNyArODIsNyBAQCBzdGF0aWMgdm9p
ZCBfX2Nsa19oZnBsbF9lbmFibGUoc3RydWN0IGNsa19odyAqaHcpCiAJCSAqIHByZXZlbnQg
YW55IHNvcnQgb2Ygc3RhbGwuCiAJCSAqLwogCQlyZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQo
cmVnbWFwLCBoZC0+c3RhdHVzX3JlZywgdmFsLAotCQkJCQkgISh2YWwgJiBCSVQoaGQtPmxv
Y2tfYml0KSksIDAsCisJCQkJCSB2YWwgJiBCSVQoaGQtPmxvY2tfYml0KSwgMCwKIAkJCQkJ
IDEwMCAqIFVTRUNfUEVSX01TRUMpOwogCWVsc2UKIAkJdWRlbGF5KDYwKTsKLS0gCjIuNTQu
MAoK

--------------WrS03HCPds46SoHgGJvJqrD1--
