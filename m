Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500280;
	b=FW2KdPdbFW878Ld+PpzUSBDJmZa+ZPWMaUVSdp2AGXbj769alDTDWT8cjfNgVIh+vP4I
	 GONJxKs5iJRLc+Z2jtyeciAAud7Qm+fwGI5d55Z+NY6tV+YqL+j7bxZgEtDRGrvMW9AgC
	 7Hi/3BXAusnWFwXUNvIyTFGDIlH0k/4aNH9iTbkyBjhrZOjJC9Z/NFFORJsKkKstzpdnu
	 y09XooTQE+rkq/aFzXv8R7h3zYhis7MtrmC1BL7EUGTX4YqYuKxcFtZkhctj8Yq9WevnO
	 abOUsUXgM3iM/ofkKHDF3yfwh+Pgvu9e5RwXJNZtl1TQ1raRcZApH92ckfqHy5U4nQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
	b=m5eb3+0rZs3wT+WoI7MhqIaEVWxv+CYD7zNzGq00gJpOZhbUWJl/p2UEHWFzufeQoXOT
	 14cIq3Nx3UF9USy8Do0oDeSuJ/8oI+h3ZKiIXtEUmBxuJycR5rL3GoejNfgbl5zPsiRf7
	 V63eSEpdPMUr5jKfhU79s1yLUnAXsXwexT96XeH6U+Obr3KiExN+irZ5cYfRZxNdiXTFZ
	 hRx7bQTIl8/ojFnd8EJhtXUCIOFIvAkVXaW41Ln4fgr/Cq+Nv4sPTngc/Ccoc6c0+JOFd
	 yMNAUSZ94L5o+c9Oj8zBEjyS37Qf0uCibSTtIjoTp5lyEgzIZZ7ftWmK7Tv4e9vICkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPgguQ0w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2Fog2h+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751CF606A31B
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 751CF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KPgguQ0w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g2Fog2h+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwtOF1929065
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=; b=KPgguQ0wbKjaowTM
	T2JqPto0HnRXnD2+amMCpJjuNJNdjRdi+dkg2CLG87xqKP0lO8malGNdtS11Q6nu
	MsMUlpsnXJLm4kRK9Sj6IYrAtKqLf/KR09qv+ZsE0b19TTWwBPZ6xvU3V/0rILoN
	AzKmRNsow9hWhZccvM3s26jcZjGgGmbk3bogUwQ7emfqFFzXJvdZ1QPVfeSweFOa
	SkBqpqhIpZXQTxQc68ZYXllq85H5B0q7/3gB0T3oiFZIsq0qIQilpIM23nTne6UL
	phh7/cN5/zTHFbZk71xbvOCVsklIKwLigvo6wNEpHSpwqfXoLgvpkX7nODnsKux0
	NFh16g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntdk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 12:44:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cbf2fd504so545531285a.2
        for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 05:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500279; x=1793105079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
        b=g2Fog2h+SzjdMLQYXVDkHJ0m9WmId2+O+ou7+iNhFxX1yKvVMrWgvwMNlAlUKg6rSV
         3GxMrCuTZoRQzP9XfjrqJ8vta6s3ysrd4oRfva5w5hQOb8EAJ4/qWZaoEyKZiiJWPlke
         /XlcP3lbqGwKScaTf9Ix/vbhJodDQ2MmMcSGfWuSRP0gTAl991FNs+sDLd5Q19rLmoe2
         J8SVwZyIRFkMpmEAS+8pHQD/FRjipT9bFX10oj1I+E+MmDpsUUC3LygmaLMpCx95oJjZ
         yMXYDsoJx/CBV0M0wmHQMShHcy9z2rHQexClp1IMi5C9GFRWKDnD+iNhPEfwra+zz9u9
         fBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500279; x=1793105079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VYAsIZfOfOOdrWKotexzjBSPJizPU25cltjgjHnE40g=;
        b=BbQ/rdTNmn5qYXVKVrtWRSUMAm6WRICPZnp1E3xXD8XRqP0cYyGQjm3OnFoff/4gIZ
         OY4yzkrkGhYZ0VXYbVr0EciAtxwZK4CYQ2hQ1gIrrwjXzQyiA8w9E2jUxFSug4m1I2Vm
         wRoy3kWpv2wJdxnFXmlul/EXHL2t33t6lav30jSNnushOTDW07DSibgOXBAab9FrCwAJ
         pf2Atj5p2Y40vd0slVx0WzO/xGw5GHQT2V+BZryEypkBl9vCqhRRcwlqI3ZOzDpYIlny
         LaCNS5ZPVehzdit4WO4G3Hxk+ELdmFrPxZwouzMVE1MFohDE0AIyXhjWhvONpl2wjJe4
         TLyA==
X-Forwarded-Encrypted: i=1; AKwUvBxK8xgZro380B5J0XYAkoNfLnLsO7Fcob3577YA4Tie4ydUgQQi2WtcLmfokwGloIuQZsuKXkffYdM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwI+Zctg6SHPDtWgejD/Rhh25TUzZr2wVBfdEQAWOg3Nxt9YF3
	s4ZlGVQ5DQh/T+W4CbULpdyOy0g30w9paRMgTl7coc62XmAwIvjAh7ExjmbtiEc1meWriyWxfA0
	/oCGkFvW2GyHuSiOiPm7/KZa2Z8oP2z8txkaViQxWNbVpXG550MyrZTJGDIyvdmc=
X-Gm-Gg: AYBFou0lrtdw43DmOHcpizAx5HssoQdVYSNw36sfCL+OM96yuoKGEyVXxZ5jqk2a9N0
	RRILMB8D/5JhXKfR9VsYAetZtNLyQX79pbL1MXnzjBqp4cij4+DA7pX5YWQEaJtgt2xCQepNmB3
	fT4E6JT0+dzUDzVHL0SHuNTF/lFTluYW/bLzikN/79wbptXVtk06xVRcpWHpTPFb5/doEYOln/s
	JZxd/ZePEQcvKENaRAEjHzmXtY5ufRTlAkoVd9+/RQKs+5QmLhNjPlKxZNbIt61tvU6yOqMQcWi
	5MiqwzaW1l8017tSnBzCPT3mdNxuwF3RiNRiMFrx8RintnSkyxuukWm9Wx685YV2p3THinn1W6O
	CImUe4JF+DJ7+qiU7rLRBym8p3BcY1zY=
X-Received: by 2002:a05:620a:31a7:b0:93a:1048:7d2f with SMTP id af79cd13be357-93f29d307e5mr1871425285a.41.1792500278807;
        Tue, 20 Oct 2026 05:44:38 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:93a:1048:7d2f with SMTP id af79cd13be357-93f29d307e5mr1871420285a.41.1792500278289;
        Tue, 20 Oct 2026 05:44:38 -0700 (PDT)
Received: from [192.168.1.73] ([92.247.57.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82dec7sm5868592f8f.46.2026.10.20.05.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:44:37 -0700 (PDT)
Message-ID: <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:44:34 +0300
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Language: en-US
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXwGwecnJP4Fgu
 r9zc8YHiuxN4rCYmhhSI1KSJtUIfx7g+hVpHkryaSIKdikYl/RQR0wQpWGtXVyX4BwFQPRqa5nN
 /yoB9wuSLJbXlunapSJh+q/MUK90pPs=
X-Proofpoint-GUID: BALj-GnKCtVnIcsr-4FdWO7GyJqAw2B_
X-Proofpoint-ORIG-GUID: BALj-GnKCtVnIcsr-4FdWO7GyJqAw2B_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfXzYCq5Y3JgrzC
 bVMBS//KM1lLsxD0Yo0/nkB5Khbrxlyb9xSfUUjaA+hMEKD+Rc0zznr4zw5yBXfIfQ+HhI+vO7O
 ykNpRS/Oiwiflau2dR3MXENqZK0o3IfixK1WcEFG2VyJgAVCw3FZnPo87CtG709RnkjXKYcdoRN
 MHTMp8IjNYDtE/BfABmHg3AooGxw88vrBjluqNNs0BJbHPIBMJYjjWeGfjMj+12hjL9vYwXXr4F
 WPWUOO+cSh7/QnIWtEVJnRntNY0ixNaTZVxi6HwCNY2cW4IscQ5oH3wcWf8JdxATN+vihlED+Rw
 N2sZVrvMentWhEEPwrCb6R92dyt8T8QRMr8/oQgXXkh3hV7G3n8PYeyRLfj5FwMOSmMnXpLX1A/
 qoaLezAK45BUkSXKiDFHxS5SfgHxAP64Ozh3YDPHmtw044a8UEP5WRsOxgcbFd5mkCilnOzsVd2
 1n99u+jH3HHuAL43duw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad76237 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ybD9qRDIDfZaXNPQ7Ca20A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=YZ1k_EG-GQ4t5jaSdRAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 10/20/2026 10:12 AM, Krzysztof Kozlowski wrote:
> On Fri, Oct 16, 2026 at 08:06:59PM +0300, Atanas Filipov wrote:
>> CAM_CC_CAMNOC_AXI_CLK is shared by several camera blocks. Setting its
> 
> Clock is not an interconnect, although AXI suggests this could be
> something with bus, but it seems you solve driver problem with
> interconnect description.
> 
Agreed, the problem is in the drivers. Today each CAMSS VFE calls
clk_set_rate() on camnoc_axi based on its own load only. The last
caller wins, and the rate is never lowered after streaming stops.

> If you only need to solve "last writer" problem, why not fixing the
> clock framework to accept the votes? Otherwise this should have
> description why it is an interconnect.
> 
> Best regards,
> Krzysztof

I checked clk_set_min_rate() and clk_set_rate_range(). The clock core
takes the highest minimum of all users, but when a user drops its
request, the core only clamps the last requested rate to the new
range. The RCG keeps that rate and does not go to the lowest allowed
one, so the clock stays high. Fixing this needs a change in the clock
core.

icc-clk already does this: the interconnect core aggregates the
requests and icc-clk is the only one that sets the clock rate. The
camnoc AXI clock drives the camera NoC, the bus between the camera
blocks and the MMSS NoC, so a bandwidth request matches the hardware.
gcc-ipq9574 uses icc-clk for its NoC clocks in the same way.

Which direction do you prefer? If icc-clk stays, I will add this
explanation to the commit message in v4.

Best regards,
Atanas


