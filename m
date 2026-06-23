Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0AC36A341
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208567; cv=none; b=Ll5WaWUqPdEHHzsdgs/FJXch2GqWfNwCEQ9X6+NY1KM8I/AHNw8tDYfq8TksQiuzvYsVqcvQ3U887F6IdVry2H4/zB30Iut8wpHj4ABfOLqAa7WdzNkC6yUoMxsmWEvEO19OdeqNKJlVMtQ17dFy3db0AGJpiJtFpjzxvplGWiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208567; c=relaxed/simple;
	bh=TuuVh5rWDQJNKeCix9U0TUROxQoIHHTcGQZRv4sVMRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vq40oxdI/0GIhMXhVPZppa4gFwE/YUHyff0XIA3RhgA8MxoU1pmcPZdNojp//4GiryM+V/gNoGhSD8n2MMfNyTZ0GeXekmJ7Tz6vRCIPN//TUGZUXZkeUZf/uYMvWhisLobVHC88fK1Z64kTvI+y08dqDWN0xrju9hh2WZEmgn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hy9+CsQ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DT5ACLIn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hy9+CsQ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DT5ACLIn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dRPc3631327
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=; b=Hy9+CsQ1WtvXWdVT
	cTv26O88rGKF2e5vnsuAkoW9mBSoWzMtuF+0LVpShZzLYyxpc/LTvO8YhzmHvics
	SaW5wK/MfzoQBl3V3mbWnlvnhQWNhn5yEWdFAyISEJu+6mPjG5RJV+LAwkrtfWjI
	4PzCe2sbjgmJOaCkPcjA+YKBGwuZ+4KhW9tejZdzOGwv+AeHUT94RDlb0j79/B3Y
	Fio9GYRFl57e8NHG/AX4rvRU9XGF1XbhkS+uBVXwz2KVt4vQoRfCxWfO+6HH0Q2Q
	42I4pM9Eqi8VEfr0UlMh/EWAKHT+tQgSWfRvMRGbHfn/tGq7qSr6rpQV+ZWxW01Q
	LfVSVg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvrw8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 09:56:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5175bf22b1bso68971701cf.3
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 02:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782208560; x=1782813360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=;
        b=DT5ACLIn0c6+QKM5AhapbSQrqqfgKMMcsql+F+sFCkAhFagDPf+9ppU9BWprhSwbE8
         HHW/ABIbeh4mGeS+3m4k8muZWWChTdjcYffZhrOv+OM0DMwMlxqEKXKK52jbKej5991L
         MCVDyXSGc8byanMzhyuO383pYYxKOHZGeV3hpFjGkF+djDyxw/Q3jiB7snw3C3ls3opV
         AxQ3Y5WzNVjBaCYISUCTRlsXABP4q9KvbI5qRv6QB8RE8unWy/bWrNfNwJnOyi07fwv5
         WNalVybOF507WBVWaNH/hFa7joNOBJ086ieo0jnsdgEJpFni2hpmFhEiYwDvzWcVuu6r
         o0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208560; x=1782813360;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oQg1GucAyJTsYEyGewOcBVX2rr60LtF1mzWX1fFcj/8=;
        b=Zjt7UNpaVQlcs29xMzxWNjSE36HWY4eCGCcuj1AyIY8OW/W+PO8Hryg05IKpn8YdzO
         thTGnV4gGHn3h5Gpr1itKNw02aKX66YKu4NwvdxnyR9Xsr8Qq/xo+c1TXl7z3dEBOtmb
         tJfk8fmc7LpAx0CGaSCzkw9EssJ7H+Woauhw9Xjec8rp0ejUgN7bnjN02ruAme7oMDL6
         z6Fuai1sC7rpDCg2x9SQuMY20Bi9OeMLnswYyYp0qf5HJAOn5tYtwSFYoHKQI3Rr/jgf
         JdI7rpnkNVopFAh66y8yGI6ALQeGZ4bCfEZbW2moZ4y2MFL4awTTHx18XzTGpWorPBJU
         WPXw==
X-Forwarded-Encrypted: i=1; AFNElJ+mYp3Av0CcIJp2HvUG3Q4JEHr42E1ZTfR63dZKxsQnrEKymuXG4+BV8OnHWQ8wfd5tERrFNEMizP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSeffV8DU+XwkNlA2c2OAknFYLm5aWQ/AJAlAYJPTr9+U4DIHk
	dCdIBLa53EzNw8H4EAF5jEN78c3UsJPsOpa4ryCbrbejkMNo3Na70mPqRtgZtVsH4tNkbkpnoCv
	ALQXojcK7cu7SMXKt5Hj5xGwKjtZx4CwDKpGYldlZedv9rif1BKET2aO4a+30RC4=
X-Gm-Gg: AfdE7cm9f34Y5ruDJCKFiBIRoxlQMY/st6jSv8l/jaT5qC4tE183dylwwIeeqPrd92s
	w4xUOLVHfAedvE3WSRD+kHHbQXzP+L0vBSzrXdxd+uMCvBzUhXSvT59r8OVSHzNEXFNwhqJ5ZCM
	3tgPLhHXOr2ez1vYb6JCQzQ5Zh9BtUjS5E3D6TmsV/eZHvmwvQpqtdK0I0byvUua8GIzIsqKHBB
	vTObnJD9hMNl3uFdfmpcvR2ju5L144yJEACavBiTspZmjIUhX84T49eBjsW8BaKk9LdOigER45a
	MiHT6Zy1mOxj3TM5s5VC1WYiMVajDDeYHCOhCZHa+o5UyT4oqbGSzAI2pKbuw6GGuPSZa+5kl9y
	PscajGF74yXg/MEU2FnBZNFOG3OznOP+1Cf3IFsmx
X-Received: by 2002:ac8:5dcd:0:b0:517:82bd:46ff with SMTP id d75a77b69052e-51a547fdaa1mr31502781cf.26.1782208560029;
        Tue, 23 Jun 2026 02:56:00 -0700 (PDT)
X-Received: by 2002:ac8:5dcd:0:b0:517:82bd:46ff with SMTP id d75a77b69052e-51a547fdaa1mr31502551cf.26.1782208559652;
        Tue, 23 Jun 2026 02:55:59 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c579dfsm34473542f8f.31.2026.06.23.02.55.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 02:55:58 -0700 (PDT)
Message-ID: <f8441903-c768-46a1-8f95-b1b25d420a2c@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 11:55:56 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: ethernet: qualcomm: ppe: Demote from supported
 and fix maintainer addresses
To: Jie Luo <jie.luo@oss.qualcomm.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org
References: <20260623073307.36483-2-krzysztof.kozlowski@oss.qualcomm.com>
 <0247dfba-1c14-4fea-aab3-5489a36f35f6@lunn.ch>
 <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8b0560ae-af5c-4d54-be02-d186be1d799c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a5830 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=qMZSjPy+XpteAuilWfML4g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UHseL_0MqL1Ls2T-heYA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4MCBTYWx0ZWRfX72iJHSsOe2P1
 TiBalsoKjRdbn3xlyrpU9DSRwuwl3k46S9n799bYGACuOZ8+IEeq5ptGAK61u8IsZGf/bj/L8lx
 V7YdQNMsk5sC5RH2mxlvrwYIIOoqBeI=
X-Proofpoint-ORIG-GUID: WYji8W0Jhex5GMj7lgpelZGzpC5JK_TZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4MCBTYWx0ZWRfX1+TReErzxr1z
 xouqQoIQ1AA9hNKCYC9fRBbj6j9ZS1kz8r9FhpfuBCjAlbMWM8ao6KEGztDvp1aS56+SS0SC9/l
 RzFjK3UfrmQ8MrHovPwmSDaFaydKChqkIUE+QnE6kBIeXrOtr0fQ/AIDJWrIH+RvIcYToU5rVUN
 q3207muYBouKyNfyMo/qXrrUisqgPnv+EIIBAqpx0y9PaiY7Tode4Zt0bVraqFhVzJOVp38ixgH
 AEhUFOtLYPJKlOpv5MWXPKpF9ibNZI2n0S+JDtqGNsJFrVHW92eLt9HFezFzUcFfMgpkoiylE4G
 xQDppTbMz14ecbfZFSBKtg2EEIW5zjbx97f/V9jgHcAsVd2qHuDkqPhwnnyR6dExlo9D6W8gbXX
 VptgUNOm4/uyYjxK8G+PpdoHtXwPRw==
X-Proofpoint-GUID: WYji8W0Jhex5GMj7lgpelZGzpC5JK_TZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230080

On 23/06/2026 11:42, Jie Luo wrote:
> 
> 
> On 6/23/2026 4:10 PM, Andrew Lunn wrote:
>>> Driver is not supported - in terms of how netdev understands supported
>>> commitment - if maintainer does not care to receive the patches for its
>>> code, so demote it to "maintained" to reflect true status.
>>
>> Maybe "Orphan" would be better, if the listed Maintainer is not doing
>> any Maintainer work?
>>
>> 	   Andrew	   
> 
> Hello Andrew, Krzysztof,
> I will continue to maintain the listed drivers, so their status can
> remain Supported.

Do you understand the commitment/meaning of supported in networking
subsystem? Do you commit to the time frames netdev is asking, including
running the tests and reporting results TWICE per day (minimum frequency
is ever 12 hours)?

If address did not work for half a year, I really doubt that you commit
to above.

Best regards,
Krzysztof
