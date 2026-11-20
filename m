Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169570;
	b=C64OhXynwx6kP+k3XSXc8Eimnu0mLT6nJ5HrjJjc3CcInIqz3w/kRz4QstPIxewF3njP
	 GZamCBz1OcH/Mt7FW/vMwFWtola6bchnOur1hVhTXG1meZ+Og1YX9KJ3pcg3UdA/FOpDC
	 7DVENOP4B4b4GVLRxJQ3uUriglSB3lJjZuxeh2TkFeJG19wJEp377ZLraJQ/uQJZx6Jj/
	 PlYgqzkCpEDGpVoUPuJSRo5wTU0N3opjyaewAHQR+4WHMWxT3xqw6MdHJccu2kMBlG+HE
	 vN2UugtcOkv9LaIJzkHsn7sSwao+0qg+nr5Rk+l4O5fDRFEd3WRRSlJBK6BZ+Fk1Hyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
	b=WHL3bPAzkw0Evvahq4OdJacrvzkzEW7kSyXcc2YGaB9DXDJknFAVH2Keyoua0fG2O1cq
	 TiZj7HkfqQlba/BbyThJo5WbG6ugcwemk3xUCVeaQMloyA8czLyb6vZDBytF6/6+DaWFN
	 aY0QsITnZXDFsRLPzsv/1lUWRnFn0JuJRt1Od+zJOSWnga+QA4L9olHGhpmobIBtQPAIW
	 9JmLlgPRWw71uJ300JDtWmuwXJhlBOxT7CUXJaAUtBwu6bt0F9zDMM+V/oG6XwadXgpaK
	 R6J8muNSDVIMQPqKj3QBuMt+ssLZMrRqxwzipVGp2gA8N8NN21Vj2PJFOiOekQ3Z2pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B085F606A325
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B085F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OuzWMIja;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d99DNyi9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7f03Z1742007
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BYSlGEtU75YElxD5lJINvAQF
	MqsMXtuHFnBFwhEDs8U=; b=OuzWMIjaj2D4CNLoBSuJtqqSam1WrBXTZkGhhaqd
	j8bdTYi3KvcZP9jenjLlPtdVrWuM7MsE6Rc/We6Q4kAbUfEcIF/fmMdTEy5b/L1x
	iodrUkmSUCxsNf5RJBw8YQ9MXCQOJFJA9IUSMJ7dMk3foO4Ows8JSLcq0bRFkSmG
	j6e/MUHhYiGqPoYVYzIfHZaE+VodUJz75OY/eVakvEBUWBh67ZuDX7kRdm5PhxF5
	8JiHgRjxrCrBrWNmPLhlBs2p13Nl8OwFgAMSGY2L8wfFOx9K/VjBHal+PAAphZD3
	iWRe1gbS2rcC5MHV6Z+IPa3Kn6NHihnqGHFqQitOpMlhDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yhcav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 10:12:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94960bd17b5so133538285a.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 02:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795169568; x=1795774368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=d99DNyi9Or35O3bPY1BXPVgy/15/SwziMuu3cJIFzkrlShwlxk2M8Eq5WLNz/zkm/I
         Lc8vB3OA1eC4upVrXOLkl/rdbGWW/CzpirDtXgaB2Hrt9v3CrcFPbqdCXNejjl6ng7Z5
         Bc4bpPVR9nVs6HWOCjopP7Gu5oQGuIeHpKPRmAOUAoMQWAr44AWUGlzEUCkiU4ZHl2kn
         Bv45CI0dJV1IEs3kglFGseqo6WX5oZYju3YZOqCSwFBSmFxM0SJuf6/uKfzzFkQRbYb+
         6EMHxHYHMBCeTcZNZRM4aoP6ynGF32xgUUsGACv02dtqZ4OpYZMqXggYOCXwV5SOCvmi
         46dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169568; x=1795774368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYSlGEtU75YElxD5lJINvAQFMqsMXtuHFnBFwhEDs8U=;
        b=ZHjJT4gpYGVUPe0dN9AQSBbsfuzp1MvN3S8WfUPwZfvDbGGKs+1XSQCBBsI7EWtwl2
         lUm7OhAaHM5ejivuV7rstSjp4AIkP71mRuJ/dlYFszMfYfp4xxrXeTUnUDQZTiYzhixh
         r7dAMqFTrtEE4wC6HaoJXKDA2cEUtmWr92jmO9ve20KD8BxPS9T7rqwlPXwSWjNrmM5C
         Q8T48Fz0Trw6dmTtkhYy0q74VQw1sy3C/fy7zZYan3oUKIGcM9leRM/YLUZ44vGPu5AC
         kaJnXx5XA4b7tESVouDOJSBw9yjqWNawdU6WJaM7mhyV965S1Rd/GcJXiAZzmLjz0oSY
         ST0g==
X-Forwarded-Encrypted: i=1; AL+hErF+TpFNOvKN5dkRO9+Xzq6BkTniPYT3xI+Pe99336yxTZX/cWzNhtd16lom5NRbq2sR4lwyo6dWy8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pvMT9VPdr9DmRHhyKpQtdH8v2m53vqrPQR5I5GyyfPvirbesK
	8d2syvZRfDIqNDhAUmTtK7IUuMnJ1a49+/rBmpB5CXQKlLuO8ituKz7LMLGaGmfCA5+Mi5m4ItK
	tVPqWEdW+GmM+rGrv5qdcs/ndEJBJ628F52B/WSz1xWh/TqFwYhCVX2y7WZoGfSQ=
X-Gm-Gg: AYBFou1sNVuv8rz9oIrwka0BS4oFqri40+arLY5uwYS5dswd6/nCDCbRVxgnajSepzb
	/bxm+RkXYUB3ScwhLU2jjTQdc7AAdUDViRw4WMXoW699ogB3AnhQ/QEPfpRQAFKjixiGGipU9DB
	3neoEIntuLIF7q6UFgv0upi1H/Uf6RdIHrd0xs6/Id6yGWLv3ofQmIopNvQ/FN2qdKuz/p1E6YX
	WgGp1t3qfrKs91HZLzmcprfdwa07BDAmhX0OhMY8mT/i5Rt/w2YATQ51fmZTvq16VYVQKRefTXp
	PwfUBg1gWkzkA0PvOpDN94yIM+0nPg3BFKPgvE6irPLfw36wtTZ9AJvkLQ21tu/Rdt63dKM9XDz
	rvwi2mmypltKtugMe5Ae0HvQCCR8wr1IF/t2ppf/FEq87EuWdfglY6dllRv88eldJ
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464640285a.3.1795169567734;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
X-Received: by 2002:a05:620a:4612:b0:949:7fc8:c71a with SMTP id af79cd13be357-949ba80f896mr464635785a.3.1795169567099;
        Fri, 20 Nov 2026 02:12:47 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm104468205e9.11.2026.11.20.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:12:46 -0800 (PST)
Date: Fri, 20 Nov 2026 12:12:44 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] clk: qcom: Add support for Global clock
 controller on Halliday
Message-ID: <llizdibjhqld7dbkdwt3vz2oyeiqsqb4rduunjlnthmhy3r3c3@vct73wnh6kpb>
References: <20261116-halliday-clk-v2-0-28208928da36@gmail.com>
 <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
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
In-Reply-To: <20261116-halliday-clk-v2-5-28208928da36@gmail.com>
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b001d20 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=QvFfK8P1GQIJS_-KitYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX55Azjo69TYxb
 9S3H8P8vQPQBkXePchMMD5sHkGMK+iELbkx6bJsUpuR5bWSDvWLnZsOVPqxeHq/aTaX4GvIHbXu
 xIbtwBa/SNdnhwtImLjLtVMWe5Pxh2JtzmRgBBv6IH2m6hBs5ghi87gnwV/OIPVLU1xxsRby6en
 6TvDb5ouGXtwbVjTjBJMEAjNl4sDvlSj6iH8EnDEf3wSEPSJBWr5R9QwKeB1RgHI83qH7U0ijWe
 9xEZhNFU3GjwoBONnzLGRH91n3QOqGu1sX6psfaEnZwat2YA6zKahJnjzuBMYTY3cY2An7jkmxp
 lrwyLkeiRaKkk6m7k4lsaX5SA8j3n5odIyTEFsTSby7r1EdAfU7vv48a87sGn1UH+jwa/6C3sfT
 UnAy6YhLblpFz/1fOMSGiqlk4SlbuTkIGdEsnPzhcA1ffegwZovjXODd6CyPHiXtHdBkaREFeZG
 UEneNBmokCKvoNsh38g==
X-Proofpoint-GUID: 98PxrNpqiivXP3hQToqGcrQk8TFj_rFU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MCBTYWx0ZWRfX2Fo2uCYApuZr
 YaxC0fjpNAfZ9sFN2SwTnIG09UJ0tCio/DQZUykj+NBceyHAyeWxVF+iiaRZJjY/AohTJlLOfFK
 wSvFs8HLVNQSnOQFtoWTLpx2jBZcGUo=
X-Proofpoint-ORIG-GUID: 98PxrNpqiivXP3hQToqGcrQk8TFj_rFU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200040

On 26-11-16 21:24:23, Stanislav Aleksandrov wrote:
> Add the driver for the Global Clock Controller on the Qualcomm Halliday
> SoC. The clock tables are based on Qualcomm's downstream gcc-anorak
> driver, without its hardware-control and HLOS vote clocks.
> 
> The eight clkref_en clocks are clk_ref clocks that vote for the QREF
> supplies.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>

LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
