Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D088C489897
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954274; cv=none; b=jwOonBLQYoJ8CiE9Ar+t35fMMHLLJpS7aoLbTGAyBMX/7oUa3WsofUe8JQBf6+Dc4YNWU3Ec+JqZysuei6nfV9Ww1LLPyNL2EmegwRZaweptvDYSCB6O0tvHJpj6l9MTbfMzDmYresgXx7ME1c8PTA//ygpwtBW/cXUh0/jNeSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954274; c=relaxed/simple;
	bh=Q5ojKNKo6HChrWiC/HJMJ65Lk0CfqxwiOcXmEevOK60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bWMe6v2Yurbf3JwCOdYLeYeln/sY57hVJ/K/Okx8fTqyH/ZUuaJ47gVI84BWdjCfw77kIIYDm1B34g6XsdS8359L0aPmuVDT0KWXqwz3WQpIdafbsmNpfzZAc8cZrMFzcTgvQ9YJbWziPgPEqgkvzlhdaRfZpChMhff0fdBCbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouq0vNez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AXP+w+JY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouq0vNez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AXP+w+JY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUIYb1144596
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 11:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Z3vxjDucbkBUn20X6eQMjxa
	kCQuQENAXW25c7p6duI=; b=ouq0vNezVu/DefF5uxtof0cFcCI/P9C4ofAaFR+A
	k7QhiVC9Wx+sm1bRd2yHVPp7Lwz0TFC48ulCHzLte53JEOlC5zyTzJaD6SRz4DOj
	fqLqNJATKIMTFJAKg3nLkHikMFm1q/VS+nMRDsyn01oAjUDmmw9lE8Dc0Ianodle
	ctsvzS6U8mvm6WXdEtCW0W09RBSQO4DmRI77eJWasgvaXEIg1xCCQjXZNfh6SjLb
	c0EBY747Q8VBfB+bWD15oBk7j8DJXF7MQrGwX3NwAspYv+sIlgipkSJ1FFNJlMZq
	oKch90bDYNGhh0NcYsDMM8kRE3weuhz1TI15YDulUlzkmw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp41we-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 11:44:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-938153538caso890622885a.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 04:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954271; x=1789559071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=AXP+w+JYcP5qQxadQyyv4WUww9aEZVMp6XFe3vppCv/Ob2/9mz9uDWNaQZ64cDc71q
         96wTCH/mZOqi3oDJXRMhtsbKxBTt77YU4v7+N+tge8S/t/ieCsuY/CSnwdlcWQtzPiq3
         g6yt4ZJjkBV/dPfx7hwNJ3cNcykNjzxt8yMJqwUdYwDR8B9K5Chy61z8pzMEED/7DaUj
         f0BdXWGyFRJGw29+yhCkRXI9156LgVyzne1jbz6xmlMnGz0Qz0UjOynvHZeLarCXUr+r
         edSvhfvxFY4fu0Em31IQMTxwg0UsNic7ghTqs592lpShDUBALzdURWjQ7c4elreo0oLP
         CKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954271; x=1789559071;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=Roii1QuYOpk8CE7jae7Kf08CfoFikqdWwR5bbEKRy4YMFXWaRglTZGeCHD0NEwvAh6
         iiEZ+N+oG9Lpqtqs7IL3tlH1jDe6zclw+K2AsUgC0gYdsEZocHrVvu0Js0sEvdIXWEG0
         U6Yyf1/084D7iLQaIhf9rC5f6yznBGMyYBVfl6qixY74n0XGuoZiez/Q9tQBQL96W9+f
         ie/Rv8/VZA1G7GdpbJg1Dc4BOg3tHwfLDFenYqp5JNR3OZG6fxMTqJCSM3nOqzdmww6r
         d7EXJnNfbJzIko28F+r1QgsjiJQs5Qnk1XD8GGfA7omB048d7eruI+/YmBKDZrFnbvaK
         bj4g==
X-Forwarded-Encrypted: i=1; AKwUvByxkkBuFRUlMTa4pN7ZxrK6U8sICjVngmQJHuX1tHeJ+sNrKMS+wH3pzHx7ki6Mxo5jK0AUY59ABoU=@vger.kernel.org
X-Gm-Message-State: AFuF++mIXXuoXv42O9e3wBZ1doIMkvPscfzV0oQ5uoyUbhXttURh9AFn
	9ZywCuep+NxvEQ4Z7OG9y6V5jifG4vPEzLqPf7fj0I4bAN/zYUr2mLt/s+aLiAkVyQ9UU8FD+mx
	qSX65jiMDvkzQ6tYePZTKDB0A/2G+Jhy2kdg043ZEFD+ZR7a4OBCvFHE0mliqTj4=
X-Gm-Gg: AYBFou0Q9HVIn3YZ/egPoRgFRyAWHOnfKM52ni4CyP5KJQZFBz5NmMrsq9DpTjEy0D+
	NrQRaCybPxjW0tl0WOWKyuOiHcPzYpp5cJT7reh3hfxZ2yteY3RhOux7vaaCDWOhMbrr2OtJ7gd
	tzCenqmXKQK4YKzPNpohSsPQwHG23c6oRppFFrOStV1zh1p5XRYEPCkeVsGYnLOE62WGpvvuD6u
	f8n2pqJQos65rDf4zm4d8kOJsiEIGHbMsr+2MUvibD6Uloyg8T80NzZiiwXMm3uXxgo4wBgVSys
	dZpgLcyCprdvu9Cv3farhegzmkDhQYiB9Vk6HPKxNIC3JBN9wf1DPUsVVVGySQBZgwORnhcXhGn
	nSQzpJMgSpKHR
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614855085a.6.1788954270656;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614849985a.6.1788954270227;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm374791805e9.13.2026.09.09.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Message-ID: <jer2cwmxbsvbcyyfjk5vv773alhivskfhx3yah2biemulszknz@6ievb2y3f6ot>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
X-Proofpoint-GUID: 4WLPetP1ArsfJ-51UYr-anccVFS8D9E9
X-Proofpoint-ORIG-GUID: 4WLPetP1ArsfJ-51UYr-anccVFS8D9E9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX3EVLFx998v+O
 VBEhTYJs0cNgikRKVwZTJ+GFDhFLykk/aObcjdxY3Zk6DvgioU3TQslWWqzTKgPgRWdFT0m6OMC
 a04AVTg40DJEEB3GXwnbRdt87H3bJMhhvdH4ENDrW9/z0BZgvnhcvsBc8vokqGTv0Uxf4Kzypy/
 vSyc8eXUNbyIxJ9LN7xcnaysSgaItNdsdRWxP7mIu8XE4NdZflpinrZXwAlSUNYm+8KounLu2v0
 PQJXYCehFrqFcqUDpHJllH8r8HPtmIlkrrmKHijPKZiacxB2wTNw0fduNKYbp0deN+/sAPIQsmp
 oY7nokDz7aarlpLVtJJv061X+AG7Hva7XWdMiefoXiUwT3KbGgkZOisPwxz34AqhmFmb05ODQ3L
 CFl3dIWB7YJsNEay4Kc50VJUnjox6MF6xfuf2koIdg0QAfbcQONWLiE6A5VvfUlMMEfmA7syY8B
 PzBgsUIKZUHFacPeZRw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX1sboSJfsfLwo
 NHoGwvYpIDvYsPh5rXtL1bIqzBbJrCQsT6wFHlByPIiUc/sLgV3RYPDSO5ab4fwqRpy9T3G+5bT
 IvZkKICAjRGC7oQsf9nrRdTB7earnr0=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa1469f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=efGZWcCWKF3PpBPhZoIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:18, Brian Masney wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

I like this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
