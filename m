Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB4A41834A
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787822213; cv=none; b=WQJ1vKXZiJ1RfYM32RaOQM9hPh8h9RjY667wQD7hIS1PYXeeaqg8An/5b3q3WETpH1IOo/5Hp5Vx0KSPi43l1aoqXmKJYsBmDPMhpAjvODHBt4Nzr2smhvHxLjUOje/S2yacH2e87B9lfYZVJ+6zmyxkoFsMVozBYLumprig9cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787822213; c=relaxed/simple;
	bh=EFvzre54JxGnezmSd2Zmn1F8pbR7B+VPAVWpl2PZLL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxAjGeR25bpdfjE1c+8i+yPP6EsXF4zbFqg2HUsyI9wodVZ7WRbCOtHP/wPzDpi8soUAdOJ+OqziNXwAFkEAXQkAfmjLdXlanGA+vogTJRisLuY1y/aTQx2iB7CCTm65fihoSTGnnJH+XZf0ip4A0359YJtYHU1pu03jqpSysIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsUonT1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G9BufUl5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsUonT1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G9BufUl5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RDLP3591984
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GRQ622yfIeZ4mbFm4NRuC4KD
	EWeJhchUHxw/jWrkUso=; b=PDsUonT1qZtgzICr9wkFCgKI4C/dgi11f3zhFSzf
	FQ11tvBWhzR3wObvm+UQOepH1GKHHD6D3401nSawWmMFQWlEGJ6+bgxG2hWPwYw4
	A09NbXFrD4SjftVreF3bzkh6T+gkmWcHAqiJUKuy7dMjm6ePmjOqL4C5B6Ihpbgf
	TPvFWhgt0AX/S7p/bNsE4kiuIYQBHuS76vI6EcIxV9Vqq2N5d638P+FcFvwymkNF
	eeV5AQZ9WMhEddH40HcQZKs3U2FipQJhh3pYDBOrRHpNzlZg+WuhzFZ5HkU6FUFQ
	HhTzzramSIjq/oSQskC/Qpo7W9fdkBoj/4ggMfxzv4JfZg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga4egk1u1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 09:16:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d28f8737eso34379681cf.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787822190; x=1788426990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=G9BufUl5y+4vKqVJtQQKJQ8ZI2+E1e+nABcxb+UBANgp8Jhb1GoO/XMbRROgFBTnxD
         ElUlhYJQFJab6FCUE2K34yJKtE3LBG7fcI33FMw7XCueBMQEPn5HD9h4pMPLkKJPPB2D
         C5voyfjepI687oLDuEw6hPxb6qtm9uawZZwo/kxlvW2RBw3YQJEozm7y5DJu/iDz3Gz7
         HgnakdZFZdP9oQCiNdMWCC8pUzCQi0iJEgV/hOSq37Lv2He78Xe5fEtf1P54pf1YhyxA
         ajasy9kNDeROX2ZNAu5bhYjPv4Nddu+qrtb5rTDzCNrrg1Gi4cTkSb5E6YEgtvNbiqKv
         yfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787822190; x=1788426990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GRQ622yfIeZ4mbFm4NRuC4KDEWeJhchUHxw/jWrkUso=;
        b=DKdJtAZevBqZ4Bhr4vNv9PUB42yg4tP0NSO3BT46xTaJ6TFINe6IKQaOIooLdD9N9V
         psubSsjupuUG64BsoBsE+Oa2/qL7ljuQpHSESt5fFy8Lbr61REncXIngmwr1xSTxwHE7
         p1JcyChBS4/A1xhVMJ/YeTkUTcCtFEnTRjoS1Ci/7tZbrFxPj9/Du/aqYOukgV3jQ3Jw
         4rOgC2/yQJycgZPNjGjYH/7QBKh34/9Hlf40foir9MPB1vU7U/gm/5JgDVI6MuhOSyQq
         Ikm623rFJLJ/j2waSt3If+Hovu3cKmGBIge6bTsO/4ox5iRUW13n97RerjD7nuV6Wchd
         i1Yg==
X-Forwarded-Encrypted: i=1; AHgh+RrPjWu0qgYPUPe6WnfW2jnQ5qwqtPeQkS+qLBmuI6krbKhTx2uxatNEQJC5upa0h47f36NWKa+2qXo=@vger.kernel.org
X-Gm-Message-State: AFuF++n+QxrfXWH51iN48emqj/CovAzC0Tnkouamldg9yBrvzt0jc745
	DZT2WrqiYs+HjF8TVyzJt472FCqzWCL4wfolhMA0zR5DKE7vaXoRYC9bbd9xwVRTMH9dJVXzrxB
	Igvj0hCvXHWJ0rVIqu+n2QZkpS09g4NTab6z4pYqlSFTZnzrsUgg0SInVmQ4fBJk=
X-Gm-Gg: AR+sD11xNNaKvvZLmJ44Q6XmV7ni4cvqK1zWofOK02sfiljBwA9f/JPpTKo9It8rcRa
	UCylehb2Ga/hix49VRI/uwd8+YN0C7DvMb7/rT7bp3bsAyz1hx2I/OnJqCNRL5+gWmeLaw94mqV
	F2PyZwkeQMye9Bmn0MWwXKNabJfmEwxxynRI9QunYCM7A5FJtuY19ovnAmwnKiRsY52rCjUf3tF
	5LnXgptzcwa/q+pDaUzr3FrCYb/JgkDR+U9K21EMaXD4ZC4oobGKFQQ8FOYrXe426kZDR6wBqJq
	cjhpgyJh22pOBYcbQEajWBZohM2bEWjnJPxeYQzwC3K6Mr7M+Z9iphrLrr7421G97m8FdGhh44c
	flCyrvTk36nWDTg==
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id d75a77b69052e-52e42472cd1mr153305251cf.39.1787822190242;
        Thu, 27 Aug 2026 02:16:30 -0700 (PDT)
X-Received: by 2002:a05:622a:4815:b0:51c:61a:50fa with SMTP id d75a77b69052e-52e42472cd1mr153279081cf.39.1787822164661;
        Thu, 27 Aug 2026 02:16:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5616f7sm60354455e9.2.2026.08.27.02.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:16:03 -0700 (PDT)
Date: Thu, 27 Aug 2026 12:16:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@mainlining.org>,
        David Wronek <davidwronek@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150
 into SM6375
Message-ID: <u5ewh6gl367sc4f3x5f7xxyvzf54vznnuevjfztlgqhpjcpp6f@xvn43ih4qxtb>
References: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827063940.44497-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-GUID: oVWTvTkoo7kVCpIGXhKsW9oFvqJrtAdj
X-Proofpoint-ORIG-GUID: oVWTvTkoo7kVCpIGXhKsW9oFvqJrtAdj
X-Authority-Analysis: v=2.4 cv=DsRmPm/+ c=1 sm=1 tr=0 ts=6a90006e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wAkbjeueQAX_hA7IGqgA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfX4EBai4MijylX
 vhbLCNiIwLNFWlr8VHANdk7gzaYrcYUZkj0o1tzeXgsTWQfcLiVzNszdHGldmWiYsMe1sbykRLM
 0u4kFwY4o1iKPjmn9D88WsO5kSiHiajYogU9KRDG9ir1qoEJxVIDlJHPE6uYuXQofsXdZ0rHKoZ
 hvDHDT1iVmamIESuiCLudCDd34vmjcMSBF0exJQY/3g5J5kaPM1jpeIw62id/xd2xK1dQGnXY2P
 y9FTcuV/qfAFDqx5cn/dus/JZuXdekNQvDmpEejIPQvZGnhzz19+wt9b6xKsCvlzxSHgNxWUhnu
 MR3ePXeDs1+i3Wf/slFB0op6iDH0vRQcJKxy33qgjgTjTMKI6PycuNW+sjziX0nzQ1VFdskiCyX
 x1BMkhwOsVLSsJkDYgPbwoPmLKJL+XM/FWNHtg4CGJRi0B7nJo8iKlmzW38xAMaECRmujgMamFL
 tJNllKEoddH9eW2qpxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3NiBTYWx0ZWRfXz93Y4BIDM0/J
 Qu60dy/eqCRr+ROdkDbMC8APUHAdb5wzrgfX0WRzi3pjrY9cDzrD968cddyO2z29kCYksa/LG/m
 rwJm1AFll7wFcxneKq7kZt0PI6GbozE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270076

On 26-08-27 08:39:41, Krzysztof Kozlowski wrote:
> Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
> identical, so this could be one file for less handling and encouraging
> future grouping of similar devices (like SM7250 which also would fit here).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
