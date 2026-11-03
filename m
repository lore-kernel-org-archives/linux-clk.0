Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699684;
	b=QOBEnrMY4SEu8+7zlFKxxaGFVofrj0yLhuhs7jW1NKDM4ddj9Qp8JJb/h/SvRQVrgTbt
	 tKKD+zrINr0+RbOMqwMTNPo0YP2KZB7FD02EyhZDP11HegXW/NLhc39IsTXmas/tZGWNb
	 WxAIWYBzgDnn+ohrte1LBN91JJk5eKA0TA/QKF/Wko0R0fY0obwH9fn3p1aDFTkayqG9q
	 QZxStg7xt9PQL4piXpjxdVUIFbhLilFS0LJNRPjtjb48BjuVi++PmjPyUaZfJY0OjVnm8
	 vwDwAKagMeSSF9iMfpxxqoBN2ptnGmv1o07RTPTgtUiDYobTz3ZFNTmCGWmt6iB0FNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
	b=UFFQb4aWy4Fr1a76/rWiMllcbx6FGDjLamdkUaa9RdqPpz+h1zA7NhyEwodLt7FzKC0s
	 SUpoW5Xk1TtLumlIdkALHpFYEZWZ1RUsE1Lzueenz7+UxRGet/H+ZRB3bxVN2dypjR/Lp
	 hpX+PRKSIRXP/ulLCenAtFk/wnFqduQvZ0SIe2TX1Kpu6H2jWupii6Ou5PoWXU4skzzHh
	 yjSt2tnHq0F0HcvxKWTTtM5Zg2k5WRdPgSi4UnM92UOPPWlukFclp+S1waX91VfOcxAaB
	 FLP75JaR+mf9ITzaLBeyI4RyxAR3I6qLJmXfqSQqSGMIJpF6NrHoKz95U5W9gKw+imA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpCO823S;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJM31CaU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23977606EE9D
	for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2026 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23977606EE9D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpCO823S;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZJM31CaU
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3894dQ4002680
	for <linux-clk@vger.kernel.org>; Tue, 3 Nov 2026 09:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MlP1q3VZQzMJWxzzvYQLQv+z
	uzEymMrz2V7pNvd5GA8=; b=fpCO823S32g/4N/mDAHnZYtkrLuTEeHpslQYwUZ/
	0xJKZh2WSWxgEV1KXXtn+QGzIzJaSXjmEwfXOgcmdqGpiyCvUZ6V5Rhr/dF01sDB
	IgI7oWryKEE1obMccTAQvR4uyR4XN1+52edoTQQbuWNgDBnAwyfkKxSmeJ4sIGJM
	xRqoWqICgoMvMWf8QSSJEheO2AmZK+KLLoSTHbGc5MtuclgIFOUFT6WyQmUXD6wz
	klh44eKpTODAeI+OuJ4KjdhFTnzMbGSGJ2Kf2bfOuEHuo5zLu1E7WyDjguema3/b
	MTgg7VUk21N2xwyUAgsRkJnvlsWPERsfQI/UuCwC8XAeyQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ek487-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 09:54:43 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bfa915da7cso406276137.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2026 01:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793699682; x=1794304482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
        b=ZJM31CaUQt1CYhSIs6qQpS6MiodNNi+hnp73uLmctfkN8zcJjbHFCbC6Zd5dBNRZmP
         aH5LN6ZOlkuyzXa9tIQGFgN0j5HanJ+HK7ITIxrPMIo6rk9t3+z3ajk97VGe6Ie8mFj6
         iE/wCFbc/I3Z0Lm1TlQ4mGKwNM1TAfSamp+mvW63uD0UvBv5VOD+fT3xNksDtUHFGaA6
         0RMmVCRjBPaa+5iB452WZI7gfmr7xp7L2IqjOXsseznleSYN/o7Uc3wUvrH2N0Hi82HW
         2llMdbJMaZm9IlPH5ZvUYh1Na7KZ4sBSk1iRoHeAn/Ti8t8jaN2lVEoXFr8TZrZJwx93
         I7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699682; x=1794304482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MlP1q3VZQzMJWxzzvYQLQv+zuzEymMrz2V7pNvd5GA8=;
        b=JK6uFafoj/Yem9k6sDvdCIPVhwIAg5wH3A0BtILzATteQT+CNFcQser736UdtdpaFj
         9debQZdDeuh2knk84h5oFi62CO/vB87B5Sri2f7ZJfvF3yQRZogTGiLBzQKgz6U0rRoh
         55yGKcp/ir13DuFufXWeHEvg3eeCGySR+8vpnwyFV1yJKzdrCtaKUoIKKisgE9u1TUgh
         ITP/fkFB3WrqJUtuWOAylkKAmY6Q1IdozW6hfXw5BWmUj4/iB2tSSTWa+1j1q3MjexfZ
         0UASKrwqMUIoWPuZrSGtIarvpyXrxpKFbo7zrR96lfqD6+NAsaP4qj3tr/XfL+NX8iTQ
         Yzsw==
X-Forwarded-Encrypted: i=1; AKwUvByc6a4stAPTPcXSWPoWknro9UMINKVSDf477V7TBIl7krTnHUq6Jzze0G9AQ5C4d5uVL1ioGFV3Lcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aw5RrvTGC0jdA1D93RjfRgR3zhsrJVuu0Wtm6yk5tvUtQNF76
	JCu9d9BJ84l86JkIXz0HaPVwVAbquXk/kwRkk2fVOaV3SCrKOMR0FJgqthk7zAvwDZeaXoShDLb
	bTOf7P2B/UhKVtnVhw6Ux1N9bz+jxgw1VWei37HF9sfahwjgCPK2InC3mqA8X5bs=
X-Gm-Gg: AYBFou0YTooXy0ycCk1FWAXvXNDzuCsBAWtHIsMdinrSSnw6+o/5nOFv5BsGsi4A/dF
	BrTlSw3F72Ps2qRPOyn1ZauCWLzlnWaGwV8W1zU3A8b+CqoI7SEAnYxEg7iSw8rCiCImrwDYZ06
	PFSTw/BIu6YfNNLkLw4T0lJc2Q7siW8O1o5z4tRJlIHnOZ5Cj/nF/rjzbgwA+nL9oupI6TfjMqO
	EeOojBCdGwGRe0/Ajy03qZgs+lUKCDKtG4P9sbZvo5sPc7+Gua7ti0vfkRsmNpGSttodEOXPeVs
	7AvkVjBKXHKB07X5jL9DpwW9Gz3bTx2+3kBDhhLZx3G4mQWaI40m8nngWE3Xk/yrucrEkE7hFa2
	nsFotZAYKOLRJQxpW/MFHfzXyNyLUGGweIUn9sUWFHhuip1PWzRGucP9I9HXHQAM=
X-Received: by 2002:a05:6102:a217:20b0:7d0:5add:637 with SMTP id ada2fe7eead31-7d05add135amr2794507137.19.1793699681872;
        Tue, 03 Nov 2026 01:54:41 -0800 (PST)
X-Received: by 2002:a05:6102:a217:20b0:7d0:5add:637 with SMTP id ada2fe7eead31-7d05add135amr2794494137.19.1793699681192;
        Tue, 03 Nov 2026 01:54:41 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm25815616f8f.55.2026.11.03.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:54:40 -0800 (PST)
Date: Tue, 3 Nov 2026 11:54:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-alpha-pll: Fix the L value of Zonda PLLs
 with a negative alpha
Message-ID: <gvcpvbyzxrgo52iu5ba2s4sri4wovte7w6pss2zuqtiptemy7f@5k45zx3uih4a>
References: <20261103-clk-qcom-zonda-l-value-v1-1-9c271ef29155@oss.qualcomm.com>
 <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8d60bb8-7000-4f9f-abff-02f596e1bee4@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX4xH5J2/HUUSM
 3rTsQm69L8ewvzzeUYWMIw06TjX/GY1z8bNRZqmGwSEws+WqNZy4TpOj7nOF3whjE6/CZZtRtlQ
 Vo9Ryna7MqSZLLv58zduiD4+TCf6a9Xu/DQw2vrtE6tEjj8OYr1qD00E1Xs3KMo42dAU7+j6V3u
 Eq91ZXkGTuy2MUAyG6uMeCHjQstkZLPGJTrhbYQndTeE7KT9wt2CRVK78wzi9Hmk0tD0hXamJjJ
 /Iw/De8p491qpyO42KIiicqDTDhILlOf840cZwNsDCSDj9L6UJ/XrYcqDOAfC5CMZhp4UHJ3YFq
 hlpUSVQ+qNzjhrP74GLwW5p+qC7aPXOVYcDOtydjXaHX7wdfPIUlCSSwYdZiyFJ1Uc9nO5mo5QD
 cBoL2G8IskoiQAdZuL0xOuvfGjVVxos3Zt0T/j1/c0uq8j0GwuIrJ3XgbobEjWykSitrvWIlWY7
 V9iaWiEHRZL8HcPUA9w==
X-Proofpoint-ORIG-GUID: kC6UdFDbEtcMKfaMhBxvVaJNnVGCNYwn
X-Proofpoint-GUID: kC6UdFDbEtcMKfaMhBxvVaJNnVGCNYwn
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9af63 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=U0MhLFlXrxXVFuOl:21 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UVt8oCwF8lmOR23gQuMA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzOSBTYWx0ZWRfX234AdVKnJ61q
 2aTZsqur1h5QCdEMoWkWeC8zjcQkfVAZZLWPVvWD60F4Qn6IOf+wMt3m4FBYGtRFEYMmrLfNk2B
 hIHDJoFrMkkXf2D6KPhRg9agLswMSTM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030039

On 26-11-03 10:49:34, Konrad Dybcio wrote:
> On 11/3/26 10:48 AM, Abel Vesa wrote:
> > The alpha value of the Zonda PLLs is signed, so for a rate with a
> > fractional part of one half or more, clk_zonda_pll_set_rate() programs
> > L as the integer part rounded up, through zonda_pll_adjust_l_val().
> > 
> > Since commit a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the
> > zonda_pll_adjust_l_val()"), that function adds the rounding to the
> > requested rate instead of to its quotient by the parent rate, so such a
> > rate change writes the rate in Hz, truncated to 32 bits, into the L
> > register.
> > 
> > Use the quotient again.
> > 
> > Fixes: a4d89b11aca3 ("clk: qcom: clk-alpha-pll: Simplify the zonda_pll_adjust_l_val()")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Prepared with help from an LLM-based assistant.
> > ---
> 
> https://lore.kernel.org/linux-arm-msm/20261027-nords_dprx-v3-1-5d98b2c6c263@oss.qualcomm.com/
> 
> Konrad

Thanks. I missed that one.
