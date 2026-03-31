Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B3340DFCB
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774949035; cv=none; b=lYqNJQo8syxxrI7EOP2nvotM823L0qxQ9d9Vcb0N0Lw4gc0srLQSN5ar9Ejrtd7hIWSZR29zzHXR4Zvc2Udo96q5lt4vwB9V8QGUUyaroSR13FJNXNKnHr0DmrUKHgpTTsGEUEMbB0B/nbeWNSPozKeMdkx4xn8pyFFdmt9Lovs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774949035; c=relaxed/simple;
	bh=iz/SJN64s+bT2vQ5zMgr/0dxMe7Mb9gLmpbZUXqJF8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PIdEXO1Bm749F5Y84NFRC/FnZk2UbkrdnjOgn83fLLP01L2jfxzSUUgeotrarUx6ELQjZuhJcjlJ89OHEWNa7nB+if3Dr6ZbAKrf/E4cvtJ9cIMShkZZ8LOdHJzbqBVuEcaC0Uk4cqBqnNJeJPgv66C9Zph3Pmbz4VOqE4qIm/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kKgDjEYV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=en58lRZP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKgDjEYV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="en58lRZP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8k4IF2049642
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=; b=kKgDjEYV2nwPCyRd
	mPLjJcxBkpnZCFfh8t0Atks4IYH3HhFlB6Xpa68fC8f18wPTECZUZ/5sJrM1oX+e
	S35FdXz8mIn1KZXhe3bprKLplCHT1JYQFWTwIdDj3IVWh8bQxg4oQ7PATAabnihk
	cxN+bb1598xpGfNywMOhG+HAKVOgDXtAk4MS79QzIArQD9tcERIOTTa0drbAcm04
	/sRHGVDF5i1PnKnQ13h1eRJbhJjYL1HdqAMAh4omymh2ATeQCuli2tCjXsco46eL
	dZpIwDP7R7tpLBwu8mBfOTVrDgMPKlV9VDsEjR1LTSiznOyDHzRGJHEyP4s+XAOS
	A0sDFA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yr54e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 09:23:52 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0c30b51bfso146628225ad.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774949032; x=1775553832; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=en58lRZPq4z6CX6X66L6nm3CcE5dDTvFcJYXOxfFu5o9Lrp0EH70DJzhPItnwiJmvJ
         dpK+YUO3uWhpycmglOqeEWgLlfuxq2cbUQ2WhwK2ATu3Mto1Qu6KTumI22Xe9+j996Pw
         1i6l4JyO4AxUcyv7D0ichCPheePZu/4EnMXwJIESeOpce08/ykcKAvMJJraFYHjG9+aC
         Bf6RMvBwufUJIcKm2r+tow81Dk4jzQy55UC3hIaqARGvsd6vq5kGHaCFj0WBm/BhjWmQ
         TRkB1VCm3HgHjGKA93+FiAIpp4WEPv5N8hRiPneGsGsNyS3rZ7vmZQL9a4Eq/nrKOhQL
         2SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774949032; x=1775553832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQFXG8OxSY8MFdXHiMgryTqz9mCo95DiLKkm3TogpXY=;
        b=BnEK9hnwUI/qWx97kg/8f8at+Ang3z9DSh+tBoMy3/CoDGRaqrZKG0zK3j864Hk8Ii
         kPIVfZj9s8LGHl2C8KJSczjSQjRH0oaIy/U6oQM6nExZZcotYhtTtAX3RBYrMcyRxEwr
         mVzHajI3G2QJX2vGi9AJEleFoXl8Xofs/Xxtl1PqhreMXUSOcv8y1G7CQ728jDxagV9T
         EmooXpkCo3S1g2Wev3bsVHJ0q9JZeXK+/zVBv+HowEmrm+kZQ84enfFlrKVmeH5cdqqu
         L5WcQ9iUFfFOO2NDGI34/y+zIYPSxR4cp9LiWtWeeYpmTJXYbcbDxuEKFIX8gt0aRoyM
         ZQ3w==
X-Forwarded-Encrypted: i=1; AJvYcCX7yZPw0C3/chX7Z1D3KCL1GWBz2HFZ98dour2oyZgP0rPqUMy5iaVADorFxXx5cPTfbq2k/Ek2f0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJkP/gkzyztsjZpmv/3LK2LPiGEmux1iZaTHECP8qQAYoTJ7Dt
	SQ8HvyhOKDOwbja/oN1eneCKGCpNqoInupShDkpQ6QElfQfWy83T6nGbv+WUwli0CfS5PA6aqph
	iDLjiTykeu5goQxhFavSwy93tJul653a4/Qha+MJ7O8olNZffJ6D6ug5grpg4Rg0=
X-Gm-Gg: ATEYQzwSVK1KMNc5th+MKY72Lj9LLpQCZQDfjz7L0tc8hbeRaMzCuqkE9GloWxFnAWn
	G267htfofqwcUP2VUw4Ex2CVv2ilTmE0Dxko4AI/lGC6QK7DeHCaIpKnaHR9AIvROhVjaYIs8KS
	CkC3BKLeHbbPuwpEt4Ux3T06n6BQvlN8nPjlaKZG9FzdQYeqdq+E5qbqwuTGS6NfjU6Wq44IxEe
	sSPDzIA7evSc8eagMgatUKu+Qp+L7uQlp1T65+zdOYHJPLX9dvI3H2vX/SEVnyO7N70syGiIPcr
	tcbpcozF8Zu/oc4I5CiZExaAni4EvW1JzmfOfEClCB4RQSDKxCS5UG4ZKa0v9UyvriA8FNDgZ+/
	KH5H+WsxVEHF0mIgp870V5K6IfpptaJFL1sylF7wkXHfZ7WhdlA==
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66423215ad.23.1774949031874;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
X-Received: by 2002:a17:903:15c8:b0:2b2:5491:e32b with SMTP id d9443c01a7336-2b25491e56emr66422905ad.23.1774949031392;
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Received: from [10.217.216.245] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642913sm103836315ad.10.2026.03.31.02.23.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 02:23:51 -0700 (PDT)
Message-ID: <1b729b69-a7b5-4a88-ac25-091839e40d24@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 14:53:45 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: Add support for GXCLK for Milos
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260306-milos-gxclkctl-v1-0-00b09ee159a7@fairphone.com>
 <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260306-milos-gxclkctl-v1-2-00b09ee159a7@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JEFqnHjFGAPnm0Jqdex3teUmpFikbsZK
X-Proofpoint-ORIG-GUID: JEFqnHjFGAPnm0Jqdex3teUmpFikbsZK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDA4OSBTYWx0ZWRfX+iVdrbrT80l1
 pk+15XTBPB+pZ/82mZYHNUtgi7BupgasHJtZBqjXOS5TlKYi3Z1uIT0bgMVpt5PF/KCiOtM2eh8
 IF65KnkeKyO83gQVXvoG4CkYvTFKTcLcj3Oank51J/3S56BnQ+luee5jWLGDtOLqKegEzTVfhtb
 AJSOBZmHLmUrdMTbLoOd6d93bpekC1YzGJzTlS50H3/eX2MgHAtiRlZOuk5QtVWLFItLZQv5TZn
 jVGz3Yytt79tNdimc07fmdgipMCsJcsDdcTe5U6DwnQa6D0Rdk5FLKWmgpljTbM3vZNPd61SiKe
 zV2GynOqkUnBvW9pg9mqi9nxkzn7m4HYcNshsqW8hfirX9C1BVAXx4MfUa19vSlXlfp6+Vr+nlM
 LeVxq3N3N6Jtjw+wa2Vhw6jqaxZVji6d32tqKjac5VCwxR5O50hu2qxcbAlyAEYadpt2n/Q/LSw
 qiDguUMWVdOYSTkEBCA==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cb92a8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=Tg6AtToVi0MBdbWWjBoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310089



On 3/6/2026 7:18 PM, Luca Weiss wrote:
> GXCLKCTL (Graphics GX Clock Controller) is a block dedicated to managing
> clocks for the GPU subsystem on GX power domain. The GX clock controller
> driver manages only the GX GDSC and the rest of the resources of the
> controller are managed by the firmware.
> 
> We can use the existing kaanapali driver for Milos as well since the
> GX_CLKCTL_GX_GDSC supported by the Linux driver requires the same
> configuration.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das

