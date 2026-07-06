Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633AE426408
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 12:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783340280; cv=none; b=JoUUlOLPKtYldoDGcWxtWTzXQ29ouuSR1zmLyElB/CZ/G981QcwXK3/EhBcKfxWBbjrHfkHUWnQXY40LiBOvaIuzYtLA9X81gsXfqrCGa4LFj3ZaAXcIg6QTg30YT/iB2pLQ3pgRemhbZnXDO1rEeLK3DtHPWDOCl0So5c1zI08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783340280; c=relaxed/simple;
	bh=UeKAksBN5zfSjZAEQF0JGx3C89v56r7Jblo870pp2qU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kmp3hiqwkBZ7BE6fgexZT8PhyKStgPKmqXyGFPMmZUR0LnFNxaYjHvze7eXJk7eX4VVuDw8WfgsE8pn9XPhvXodu2jHG0zgJiMIoxNEA9G8JhN6ZbvUrMt2e9EPIlHTZ9xKm+3SPkOtTCkSfwmPbF2BAPCKwTo9QN8AghKhMgmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSGTY1DH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9/eEf4k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSGTY1DH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9/eEf4k"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxTCC219060
	for <linux-clk@vger.kernel.org>; Mon, 6 Jul 2026 12:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=; b=pSGTY1DH9paxqa4g
	MireXaJaDAQBRHTDUoRhBGqBFV9S66pXXPXdjO/nPLHKS7fSKhhoufzi0L6Bpzw7
	hrviKIewLhTb55VzBJfzVapUG16dCYetqF/K6uqfaRB3LuW2EDIwtglyaSD05DIs
	OMzCpC5Zcoz58xq2eYxl1mpO+cAe/Xkls6qa5WDAuMPdRE8sapyRH94KRfUhzLJG
	nZrIvXS31CTY/YLSEgazaHQdNvwula53Dh32NIoGQ8sAsaYno2pb+uF6vLT8/7sg
	V2F+SwJkymkMzVSnfDKOWgi9dRMwAGcji9/T/RqgIbPhsH9k+a6iaiHJVjRD5aBx
	GyJw0A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hs905d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 12:17:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfa45b280so8137181cf.3
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 05:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783340275; x=1783945075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=;
        b=B9/eEf4kOjdaJ0VYm6ivSrokT4Mtv7PZP0hpAIn2Lg8MEoe0zny+hf5Yd8S8v+Cxe/
         9KmJUY5zOwSSyXj0xUfaLf3O6IShuRqEociTQ4feZzayNxi0vvPA3WMlr8b+8z0dJFo7
         n8t8YEbURX1a/VJiYVv7KCdUfhjm9KSSy/1JqAmgRYqLZTM6JHnn/9k8LPiEYvsWZjTZ
         G+95IsHRs4ABGHogFEPJGfZmjA9ZzYdIY21I1mHitOR+VRxr2T11dzNiQneB+7l/0CkW
         g+HDsPVT8vka77DWHETzRqWycq8rBp6cpVbCMzUTd/4hECbtPxkCbqM4DzluesNp4v4v
         MRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783340275; x=1783945075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9p+Q6R3xGt4KADVRrHfvUBsLdfZPt1kAeyded2iEW8=;
        b=IcxMiPYdBlcfQnRodKj6GpDK6R0l/TryWoFXnX3NNqaPnKFwxwcKUxPSqYBVuBul8e
         3zVsHABIWTXIZdYgCSCvcBJdJ53XXxJPVEtF6D9yXmdiBdLGNNBkhJgRHkR3nUvWDM9f
         mUgzP0sLR+svbUTtDHVKeFZ2JZnzvoRy3NEk5rTw3/bWSf8j9NwqegVVe/4c9eo9PcyX
         i3CZ/qKl0bHhGKfOvabzAHanmnTFVEaLF7wdIbRhLqJA2p/XhyjX1T1v4TAVQLCwYfI+
         xfb0n/wgZXOJ8OD5/l0+QJfaD0wi1k4dYNWcVE1D4si/EzS9VXLiH1j6Wo395aFa4KGP
         xTmA==
X-Forwarded-Encrypted: i=1; AHgh+RqpR9tXYGdPJeTR5MgM9sVDZ80mDjqxYSQGSYkYJJywMfqID60MrhstO8lGCoD/fq30e968VnP7NhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrmzQgPTZjJPimJs6SOYDWPkjA+mVNGC312Cm5wO+47jc5Vx0r
	/CNkCuFkhZ4VCH2NjzGJtNshqLE0rycqJsfPlujtiawizwHWRcCfcMq2nRiJBygoSdcpaENuHQU
	zDpfVxaDkYwm0T8F11l+AzkZy6ihR9+Aps1Itu3s3g9HmAYvgSgVBlwFomwJQ7OA=
X-Gm-Gg: AfdE7cnwyEBAVjGGeJlA3hET/uwiwimjIe5oQmBsX7G8doVRlESFuj6Bb6h9A+fCiH5
	aubIPU985b/oROEhLfRpU6Z/3nndaBsP5y2GCkAVjcaLHr6Qf0jErohviy/7sPJgPRXKRPHvu09
	n+fKma7jS4IpQcqmBrpJP9uXwmmzq5xb7SQPw+2u/JsQDjNKWf0byApoV0J/GohgFTqhMTJHcFa
	N1CtofvJ9GHs8d6S2owgns2sSnVBw3M/fY8EgtQoyepaky7XnSYYVjeJ7XhIT1BloDm91SACwKs
	0o4AbuDRhCFGvTs0FWXOTxXVL1xVBSoKX9G86FPu8DwzlRKLJBYQLaDHN5Q3KpNnAugHfw7RTKo
	I32c1svO3kP8Pd3IV8d33WDnb/olnxMbxv6Q=
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr86243151cf.2.1783340275239;
        Mon, 06 Jul 2026 05:17:55 -0700 (PDT)
X-Received: by 2002:a05:622a:282:b0:50f:b9a6:82ae with SMTP id d75a77b69052e-51c4bd95127mr86242651cf.2.1783340274623;
        Mon, 06 Jul 2026 05:17:54 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbedf4sm3998959a12.29.2026.07.06.05.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:17:53 -0700 (PDT)
Message-ID: <19a78410-d11a-4ee2-a628-ea7a93f982b4@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:17:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: videocc-nord: Add video clock controller
 driver for Nord
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-nord_videocc_camcc-v1-0-bae3be9e9770@oss.qualcomm.com>
 <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260706-nord_videocc_camcc-v1-3-bae3be9e9770@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OUMxxB5KL6UHYImQHhpMVbF9ZRodWQt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyNSBTYWx0ZWRfX2GO4cV5LDnxq
 fDFkC5zSMvfqHkZTo1OrcdlcE75bWHIWxG3QJQGs4oBJHCBy58QDcgYFtKilftLLfiuFHqd5la8
 L22O2MuhLXPVSrGUvslloA4nIQQoXvnoOGi3hJj44dxGCzsQuRvqH+TizP0NO3vctiKLFmcJ1Sk
 2sa0Rx+82IvKXcE6WSVm8ophkFOrVTgQ8sfOIFSnBOZNul+/eCXfJuq7TO2hlqvbsuwvMH2du/t
 +gH+p6ak+4DB4nJBSv5T6nUpg5WdIYhGryq+Ngl+AqpU+a9zJrs+ZMwg+ZbiUKFXMyqioxmGRsN
 cPfAQ6NbNF6BQ6nppsE/Z3MiqJ1nciarV4Okx3dxgivKUXemQa7BkFxbxUMesbWMmoDt5GQ9X+T
 P2b55SJwHZiP1RKZY7gL32qsIXNfFycikY0Iihd9s4GJCvU81UJ8MX3xyx8SQRW3AKEW1iQyc9y
 yiXz6WF7m9SrZc69dSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyNSBTYWx0ZWRfX/VgYwwy2lJs4
 vRl+DsMDDdkUmLUA+PSLl2jHnyr2KwtKsdyI/4CFJMXBhp7MY6S382qVSVXPNKoe02ASpSMGz7j
 UdwH8cDpPaKv+dme03nFj1XEpz3MJIw=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4b9cf4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: OUMxxB5KL6UHYImQHhpMVbF9ZRodWQt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060125

On 7/6/26 10:57 AM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Nord platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
 
Konrad
