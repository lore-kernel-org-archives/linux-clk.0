Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04DF35EDA4
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727886; cv=none; b=JybZiz7fE4te9eXadBoeuV7BwV0zzR1blSuWwUq7Z+y8MDjK7wxe+NNMW6Zj152cDcSsByb0bjBSmqsXVrzKovk+MZVFnE1d9lBHc7kQz16oWntOUlo8Okl3zdkCYCXX6DakygL/2T0l/b/ql71MHiC303vd4D/0+FT+bi+fkbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727886; c=relaxed/simple;
	bh=KYymsWgZvfsa2Vf73oVvMIKmJDi/+uDmv+OT8hnk7hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRJcH3guzwXv0ImpYSJtcyMMXFzseNvt7v5IatyiXKrfPFPilNk3qH2HqnXqDS99vtlYbYeQhGikpdgp9RrK6maj9BYaC9KQ27js1DCKAwjns+xF6kCCx9I3mMBrNDgrz4lbKpfDazDDe6ggrgrTIw3JUKdFs+popqzLeSboa3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsbxWSzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iYN42hPw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsbxWSzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iYN42hPw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6sQPf2143297
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=; b=nsbxWSzkWFVVwFOV
	3gs12zCZbydLBjJ2r+sbn7rO3cZF6yxBa4OwuwGj6pcZNodG3C7M2g41UnJlw+Zv
	vWQM0Kll7R0FtpiqllsdCEuGjqk+xLxJWJyfIz+HuRALmrzyFv7l6jRA/Lv4cHYd
	fjR3PrZ/fKAGVvOYpR4lFqgMUWIBifrDmF4pTzt4pqvWCaf+plRBTr+UGQlTQ6Om
	gnkcvqdNFeCPv00iz2FgQ9W2T/wWpu7NMLVhKEbxHm3GteE6n3Oeh8cZ6LSdpW/0
	kSGDgEdwNStdcRcwOjEFuc+VEWVUmtlv7sztbmtsIk6hwNdSpjg64t826l52gc1D
	1Pyn4w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26x8nyqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 10:11:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92a9777b04dso88924785a.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727883; x=1783332683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=;
        b=iYN42hPwTxu2XMNnwiUbNtBO6gi8CLZQaPRD+qnimCAc3Xo0t9TOy1PD/QUGn42mVx
         kaDkGxG1C/vjHaqMIcuyv8/TVXUrCZhGWLdrF6a/bqxBE0ylG6gVhQDRjFODIHFrnai1
         TSBHOQsiZHFeDqm26IHmtKk/L0TgKWRiDwhJTZeiiFHeM7mqhDd23pknZ3+dHN1v5pU6
         k9Sd/8UNQCWsaw5AC0uGTw1xSEPZgd0uxRBMN8QJwvUMjN61Ex6VRDkH/IUs3o7552U3
         XpRSIcYEe1pFTGHq0a4PvkmLOEvb52UAGru2ONHFsQ4jpyN1wVAeD0o2kvFrDoJKGA1b
         2bWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727883; x=1783332683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=;
        b=kky0v5BH4+seYRLChptS43mWxQxCuqwSQuDDHKbnfYVoUMZkTStutx7FlbMuT1F6IT
         XC/7UfLDIN6c9W3MEu/jHxesWn6Fa1tiVHdXDlpnWCkqX4Fq9R/sxiwTgz5X5NZiM5gV
         6CbpalWW4ajjpuWs8BbaZAIH2zzkXt1fqWFtVZOq4ky2R3NSUBXixxFBHWz40h5nn7L1
         p7+d0zeH93zSxJZ1bclRTV5TI25FQddbyUKfxOhXkkp16g7LRHo0Ri/4MzJ4hynWtAuA
         DDrci6PEOpb1klY8/2MI0v5kkODhub+8RE8KHHSFUYe4LnsZ5R/spXNAyY7xLX2YMA/E
         LzKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/+11vz5q+hvHHvEuymXBZjzDf1dwuOmhcRS17RIuDa4WoeL6QbenzrUlWjsdfTwcHJr0eN9JAS9vY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwJMjCqy/TGGbo/Uwaa7ac1bZyfC8KXVDbVHYl8dVSPTp8ECK
	fLvLTVom4bYAU46YvNcHCG2xjytuLZYCVAIjukSPo47hEhKQvqh5v4EGwm+SzaYvVPNY9PdLsay
	DdclLecO6F+B7b3uLzJ8XloebqtcYkDkH+Z7Qcvg2vlPa1rtwi16+WaQVhDqQiGI=
X-Gm-Gg: AfdE7cmRIhM06y1L8tJmBFmSsvHLd0mpRjkqgE22UvOiCp5ejpt7IW5f6P8fgA+qZLE
	P+DiSAj/E9/sMSiGQtTT/aRZ6wKD4R0108f8QnUWLhE8hBtHiZKlfT+/G6zPtW6JMLXvdusrkHF
	fmkrIGXsnWHoSmudclw+6wvC5Px8om2IgwZm8X3g9q/cqS0F4d0S0d1PCxeAbGWGi8wJoEjYqBz
	vlymvMMGey/MCEGdtit+fD5CL+Hlq8Ov/Ueo2uIRPUs20A1vg2duYkVyCAF5jRmXIog1WGpqCYt
	6vGMnlKUGe15XuSRj7wvOftOdjDf/wKbuKvje7iGveJr2DSs9zErvg+6eWkhVY2+s2D3D5X3INT
	4MFQEWJ40mAW1Zq+IL/z2mqoNpzD/uAjA//Q=
X-Received: by 2002:ac8:57d3:0:b0:51b:f9e7:7fac with SMTP id d75a77b69052e-51bf9e78346mr27350161cf.5.1782727883106;
        Mon, 29 Jun 2026 03:11:23 -0700 (PDT)
X-Received: by 2002:ac8:57d3:0:b0:51b:f9e7:7fac with SMTP id d75a77b69052e-51bf9e78346mr27349831cf.5.1782727882440;
        Mon, 29 Jun 2026 03:11:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12660ae60esm151121566b.17.2026.06.29.03.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:11:21 -0700 (PDT)
Message-ID: <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX0YYasAKvweBR
 stjDL98aNAvcU4z3kWaYz3CLoUKVwg5nnzMTxJa75mhgYESsxRByjhY157Kh4dodsmsvcBW9BQ4
 QgxuYdCZrxCGLwpdeC0SMCLc0NTvezE=
X-Authority-Analysis: v=2.4 cv=D+N37PRj c=1 sm=1 tr=0 ts=6a4244cb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=QSepnEzQFVSc_k0dkj0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: xnPMPFXlIdCwwBxj7G4FDztlD7w-y75g
X-Proofpoint-ORIG-GUID: xnPMPFXlIdCwwBxj7G4FDztlD7w-y75g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX9QSb6d+Np34Q
 sMIb3yRr7gBcyKizXI2XLZ+FowyRXZ1moDRUqh8ZDDYjHqldkY7d5DF881hcWtfNdD02Ka1To29
 FjssV4x3JWoWFOv55ZNj9xMSOL7t9FdFrFcVVXytgb7LwZ4T+YKYNp7izr2H/Rk6wz1dPRfKUY9
 AN2aIsyWxfFBKl5PA7Y94FDY+k4dkDgMZ+G2YkS4vNJqsFZPfNw/RHk24ByHYAFUDtFPDE5vPUk
 rzPn57pUrJmjFfY/wcutIFY166ODs8YHU5xOL4djXpz7ReUK/Ym8h54EOPgyI5mBj0wz7HPt+Qb
 Wi3fsjbJhtNmIFgqjGdmMbT1xYheouH4Cwn2NSlUZ0j+at+7JsrqLBvHuRiW+zhFwl3nFEXLfxy
 fe4KSBxZfGNs6ByG1GXgphrwNWp2MzHW6YOTCYYHgyt10txQJHd2QHv1AdvSCOu8Ofm+exIa+qZ
 Qil+h78sQgWWaCgNvHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290082

On 6/26/26 6:32 PM, Brian Masney wrote:
> We have cases where a device node represents a provider for multiple
> types of resources, like clocks, power-domains, resets, etc. We
> currently have dev_set_drv_sync_state() where a framework or driver
> can set the sync_state callback for a device node, however it currently
> only supports a single sync_state callback.
> 
> The pmdomain subsystem currently sets up a sync_state callback in the
> core framework, and the clk subsystem will setup it's own separate
> sync_state callback in the core framework. These can collide with each
> other on some types of devices that have multiple types of resources.
> Additionally, some clk drivers already have their own separate
> sync_state callback already defined.
> 
> Let's introduce support for allowing drivers and frameworks to add their
> own sync_state callback via a new function dev_add_sync_state() so that
> multiple sync_state callbacks can coexist.
> 
> Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---

[...]

> +int dev_add_sync_state(struct device *dev,
> +			   void (*fn)(struct device *dev))
> +{
> +	struct sync_state_entry *entry;
> +
> +	if (!dev || !dev->driver)
> +		return 0;
> +
> +	list_for_each_entry(entry, &dev->sync_state_list, node)
> +		if (entry->fn == fn)
> +			return 0;

Do we expect this to be a valid call, i.e. should we WARN_ON here?

Konrad
