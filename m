Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A823845B0
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 03:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109438; cv=none; b=gz+DJNznQEDBo3tQjJPby78orB1oJ3ThIvThttBN5MpB9Ph+K9HGMiYmlHgr2px7Z+0QriGDmt993rHwRDgM4f7AvGCn0GfpPqB24VF9Cvd11W51Ed/XVjT5otYVkeZq6V7I8HFwVNtBdz6C8lY6JPIMPeenqEUdYfx9D879CL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109438; c=relaxed/simple;
	bh=joxpSdDRFY5uFv+VzmFzchytVDkJh9auHgbzpaaFc9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=krFwDDJOvRXsBoWO+tKRct4paWK+79dDLLB8ZYua1oJWVxqyw44xVGvvMLW11CVYyHGIWY0QJoLV2fO6tD+c6KxcsNMYk2arw/xF2os5u9EPUAeHW/X0Ew3+ForKvEhHU0ppV/BLXChkDf6hXOIJQux32gv2sHBjdVd5NO/VjyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MKD10HAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=baU9/qMZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MKD10HAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="baU9/qMZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67J2lQ5K3165736
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 03:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hlINreYE20QvbsWRKB9jJ8Pm
	iH1RXUH6T14QxKnWCfc=; b=MKD10HAij2FTSYD0ZvGUvqWzQe4gp0AuieSRRL4f
	zOpCwdGVWL9buJcvaq1Dsbr/62HdqQz2INQ3tauntBiKGcEIl4IfAXbDr2y94NCO
	jt1KGQZT732OqFtd6o/DmNLxnjLET8JfilisLdyWRwMeMcfexw/O14+LSaolgvwP
	iRaLjExWfrBC2RRMYGWsllqxNmK8I6uuU76aGA9hFd96DUiJXe8pGOgjcVT4W11J
	Ydq0uXMofF0EjIlCc6/FynF8/6pEsFpAsu8iQD6RXDKUNP4iQtiWuxVjj/dFFO2f
	Zyltx3vj66IbPeQEcLq5vDJo2KGMhuIADDKAIG7NkXheNA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfts2kk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 03:17:15 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930dda91cbdso107350585a.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 20:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787109434; x=1787714234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hlINreYE20QvbsWRKB9jJ8PmiH1RXUH6T14QxKnWCfc=;
        b=baU9/qMZXoSrRgPZxBcqSO6W3k6Ch5wc59p4Ce5RGB2y2HfTA64/a7w0jtSOsCtJ8R
         yGs2gzgxdHKjLnToqkV3pHF5gBFl3tenXQ9KNEGmgtxh2oFglvMrsYjjJXmvOrd+m+iu
         9WuxFbQvdPe7heZ60sOZyg6z/YSyJtVTaLXIJrabTRDGST1NgjY3pLMdgviy+9CXE7hs
         /te68wUV/QosO0zGDLN4ENWixecFEUfruSfH9/CDSk3s1fPiZpUtrp7cHkINr5YBqDGf
         pB1ZqQVUOdur1jyokDdW2Qxh2jYN67Oq+VWATnPXPxQdsnEwPn7UNG9YF5sXDUzlJE33
         PtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787109434; x=1787714234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hlINreYE20QvbsWRKB9jJ8PmiH1RXUH6T14QxKnWCfc=;
        b=pzBwgvI6vAGanJ/EayjdilKsqas7HWBdNMIsyv4sO94eGqMkPc3KhsnS/e9AED09YB
         DEuneI1Hwv/MGoDRGmxUxQ6fuJ3XM0Vs4NKDaDz4kP6VnhDXzqNSxNl7QMjVzgGJ4L23
         Rk68XzIc2xrrD4+3Uz5OVO/H34I4DqtlPmXvQISzsm2WWVszJdHwf5hj6BPRYB2KiiUf
         BvSfhFuuF0TF8bayI6FaMXIk5jmt8Ek//e+u9u4Ll43qHhYEyMKdnjoFeZZzANVDuJPM
         8HM7Gv2akFrXJ0uXIjFzb50mDGI2dtuKUVdbdM/3enzQpLqy16tj/CXMFsSBDQp5kdn2
         xTTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3tyjwz67N9EdCO4MJK4F/sdiCHQ/RlsyyFe/tUExjxglu4OMGx4VFHtHCF5ji47cBjMmpJ4KXP1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YztdIbWAqov+1XKrfo/zSjE8bH+v3hr24YIeQRET2HqSXfJaz8n
	w4yuzWHyFiRfN4qAwK7exm5EM17GyI6ch173tZ035bHzboFjS0zd8Wpw9BgTQH5YhuOa4GCUxkA
	qpqzKG6dgDaTHUV9zzoCS87y5SR4D/wuZyIyapLg5tsHSQGdyEHmNy0iE5aWZT8o=
X-Gm-Gg: AR+sD10QF6CMZoX0kOeRn0TPmKk4ifatSxv8Q8hotYjNJm7JlxD8ABpW5siMyCgqSne
	+vYlvzp6/F6GK3rnyMoCN5sOgEM11X0luoSxE0PoCBTzjlX2kZAw4Y9b/LeKYcTn5+jkSoHphb9
	F8mMRN1khpywGvw724gc5sQ6uKbpJpDBHzTxJv2eVw+PW/sGPaS50iNKOZOf35swskPaMe0fhSu
	ss4kcUqNZF9k8+VHdCm1/ls8Qkq/SSZLRD8JJPiC3ZgmdayToBJVaZVy22bV9GA9yF4I8Tup1Z5
	P6rDempVmopAwK9aeKnPyu2I9DbcpOS5SiLzbzBHx0farDE8a4ldM3vv9BVagRd1F6acjd6xx4S
	wwObfEHGEQMUb1uw=
X-Received: by 2002:a05:620a:4084:b0:936:77d7:55a4 with SMTP id af79cd13be357-9371e2451a8mr196563685a.19.1787109434334;
        Tue, 18 Aug 2026 20:17:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4084:b0:936:77d7:55a4 with SMTP id af79cd13be357-9371e2451a8mr196558485a.19.1787109433837;
        Tue, 18 Aug 2026 20:17:13 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa17567asm23713175e9.10.2026.08.18.20.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 20:17:12 -0700 (PDT)
Date: Wed, 19 Aug 2026 06:17:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        bmasney@redhat.com, lpieralisi@kernel.org, quic_tdas@quicinc.com,
        danila@mainlining.org, davidwronek@gmail.com, robimarko@gmail.com,
        linux@gurudas.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.vger.kernel.org
Subject: Re: [PATCH 08/12] pmdomain: qcom: rpmhpd: Add RMPh power domains for
 SM7250
Message-ID: <qzwjmmrxlg7s7dozxqeadokfpyvwbcdgknddysgewvgbw35od2@cnhnpmur73zm>
References: <20260818080754.4362-1-sreeshankar0910@gmail.com>
 <20260818080754.4362-9-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818080754.4362-9-sreeshankar0910@gmail.com>
X-Authority-Analysis: v=2.4 cv=FIorAeos c=1 sm=1 tr=0 ts=6a85203b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=Z0LeWUw4VpMA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAyMSBTYWx0ZWRfX/W7XulAkzh9i
 33xkFFBent9WYtWRgTWCNQIUwrrOxfoA0xYPJsNjfuNPFSqsFycB9PxItkDSS8Z8Elatk13+WWW
 yO+/4k/Z5rLpzBc6bbmp2xaWmkIWXVs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAyMSBTYWx0ZWRfX7yzKmIf1v9yS
 NVklvflR/D7xMXfmcSNZ7Iw2Fz9t14KIGu9aAfS/IYBaWWNNSIGIbAotEl3Xik6/oCZh7oEiM+w
 fYx/Cxc0Xy7c3QlzJio7Z+WPoYQzQBW4oym70lwFuuyuSTlvem325NoDykHRtVTJRncGMbJan4i
 CpDX1QyGgPvFM7rGLyXXktUdrgG2pXS9LS3hOuO7FVDMhkOHz2FjIg3D1k9x4oo9pxIC6bXsc59
 tdl+/dGvbnIA3AU2XeKJkwYRy8BZNiuCUGkjUKdeHKmsXDzqmf60BbIqow4ZhGvbdJJpaj6oIh6
 Xrj0OXYByWWeUTJwRIpb53tRMKXY+1yI558i/sQFGW/fjOH30GjsgeeOWv1YUXTPe4kvKWObexN
 SIbOyO+R3ZcSOsepZtGwxYu+pblqXTVJwsEUxabRl578LTvAOrSeiZ0CoWMlHydmR7v/s6lQeSJ
 Ldxo1wWnTAZ6kKLv/CQ==
X-Proofpoint-GUID: UUvwovraNGA4TZotCR1xQViElk6qFgc0
X-Proofpoint-ORIG-GUID: UUvwovraNGA4TZotCR1xQViElk6qFgc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_01,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190021

On 26-08-18 08:07:50, Sreeshankar K wrote:
> Add RMPh power domains for SM7250 SoC.
> 
> Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
