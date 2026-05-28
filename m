Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F203AEF4C
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779963136; cv=none; b=MM6ix9gSPjVyKRBgtZ2FzD3dneV8MA3Vqn6ZsrD5nxSkEJgIe2KNtAURfWoYm44qfCnrdXhdJfjLCE3Gm6NH1Wzrv2RO1O79p4P8nsS/AoKF7GWn95TL3PVsXwJxRTOFC1GauhmrAnbj8vbrdm+XmaJHTDmRuuewD2Q16nK0Wmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779963136; c=relaxed/simple;
	bh=tFHmAG9i/JBtD0JCXwNSHIn1d1WbXLJb5KNtV1E+krw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OdU57JLnI9bsOH+h+MhFj0ru6lMqY1yen/Lm9HZ6YoR1mu404IHjeQyEenYayBbl7Nm+j3Uqq18Jd3KXbwxr/6Xp8fcKNzUJvxOTkm4VeXKK4u1V6+fansf0sn2qo3s2ffv2KvcLP/NXSH9+qkYg8FeS0uuE4bAkCGrWkq7wHz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RejT8wCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gYvZKjuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RejT8wCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gYvZKjuw"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vkiO298205
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AuMlQ94hzZYHxomsU+L+MfA3oE3xtzzIMmJ6zw8DcuY=; b=RejT8wCNdPCXNUbr
	XGZGjTn8BCWHFhCIFGuj5Dk2yHWcyJofFMJI0GgXn0mmR1VLJFSjHN3bsBFDC4dm
	owvJpQCZd3eodp+mwcoNqMkRFU/BT2sNWOlvF1NJt999EHVFtD0IjwNThT9P8+cy
	UqD5bfoRqLw7/ae0UBcCF+4p5M5gK58Edz2FCsxwi5LS89++FbcAFDjMNvCR1QMX
	n1O7Cm7Uedk1pDDhI24TFxjLfosmjIOyljZXSEpRVqpdsKYQmRMvD5ZMet+M3Bhr
	KAbCprsmlqln/JkRPd6MpVlZlBHIDguCaobrK52cgpaPZZBAzraKnmFrQB7CPZ1l
	IVMWJA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yajajq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 10:12:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d38bfe83so138538151cf.3
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 03:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779963133; x=1780567933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AuMlQ94hzZYHxomsU+L+MfA3oE3xtzzIMmJ6zw8DcuY=;
        b=gYvZKjuw1lJ5sLmHJuUmScyKUIaVRyNK6Z+MOjhQBTCBd6Z3mzATk8UBU0ZkGee+LK
         L5Ub5bFp1GfPAklS9/zzSKc1aUD7MQB37J4p5QKyTc2HsIG9Qlxbh6rvre8kX3myiFb1
         HcqrrN2kr1BBdnOuC4ZRwazuBxZg0eRqnbTtnWnu0ZyeqhrekICK/pl94f7/a5vEFvPh
         3m1O55FolAnBKNvW6rCOM4RfIzOTmAK8+AMJKjon1O6J7dJ0A6o+d3LFHy2WioNC5j1I
         1CAfn5FRVYVIFdDrXzOG0Rpy5+lAvwki+yuVQKtnvutwckZDVjcedXQN7QNczYW/GjxY
         uqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779963133; x=1780567933;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AuMlQ94hzZYHxomsU+L+MfA3oE3xtzzIMmJ6zw8DcuY=;
        b=LJYJvQIGU78uCrWe62Ts75XL5fo9txKOGxts9L6SwPKboVIlOgSC1JmcmQhQ5IQYOM
         AxJaO1VJKBIvGqCV+miIZJZAzk1ZTWH2wJM7oXbHzw0OuQJsg/HUL+LmLQJXYuDtycG5
         +9YMDW47v6wBu3jqv5TBNCO7AgK2cPIqHin3lVWEwNjSYO5jvMLA9WL9rm978ZV/zYHY
         3vwn0fqrE0He05iHW+byo4bA+SIa+gexNymiXi8x2471MZb1/JRK5Cv1qFsWW2eSYKxq
         o+9qJZ/XuEcJe+ZHPUgnCQ35zOTGx25ZI5oMrLg4h+xKDS3oePax6EIWDgUE8gcR0YqE
         4G8w==
X-Forwarded-Encrypted: i=1; AFNElJ+6uUwqMV5etrY3eZ7DKUpkxAaUo0RWr68cnzbaILSaMBr+G1Vav5+j2lpS27ofoywDgoijwCaLcW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YylYFWiTkcI2vTTa5AtNg+6kKtVaO+MuLQE5wbpVWGt6QAaYpLA
	cR01FlOHSZ4gV5hGnWcU/za9ryAQQzOBpPBK4OBsENYmJQ/dbhiP4Yqwq6kvxl2bkN2bSYgqsWv
	5YztdsWSCtEboh6pfz1ppjaFDndfXX50V7cwRfWF6+Areyu0QJ0CzLfnAWjglCrE=
X-Gm-Gg: Acq92OHvl7S+iMoZCnRdVf0+TGqHK66hmE/RQeMq7VkTXMhIlNfatvQH6waF3tIfWgn
	N738CPkPf2GDPv/EZXsJ8GzziSkCfspW9Th1UP0euZICiVXCcLeWpHSSTZKVJqpdzQw3d2Wz/oR
	cPVml82FigiFOdXfKtBVUNJUk7lp7EgXf7+tOSI+gW1tVtdFuIdLVif7mSOIKRd+xuGS9zMduqp
	qfd/DdZQupSrbAaTeKZYlbx7aFHGjxgF4I1yz+yr5a3medEakqQL3qx2vSfXp5oc4qy4/fqX8Lr
	2xaZweAY69AzlTVTGSq4H7OYmUniZ2H7PYo0Q3CGuSkEqICk5s+BxfMazztF5LP67ie5loRnD8c
	JeF/hrmC+o6bq7j/Srw23N6XyC0oS5huY5YelU1DuTRSdIsEpfrWHkJ5L4LRqYkLxqq1wYfYJ3a
	LffL5DIctlsfOBCgllPSb8KDJq20i/4ojBc9R4Ld/BDzF0jxBZyAqSgBHy6nVCPf/QWnex1L+L6
	viAjIqxL7qtttBbWgdfvTGDmug=
X-Received: by 2002:a05:622a:2298:b0:50f:c67e:d52c with SMTP id d75a77b69052e-516d466fc0cmr364940171cf.55.1779963133305;
        Thu, 28 May 2026 03:12:13 -0700 (PDT)
X-Received: by 2002:a05:622a:2298:b0:50f:c67e:d52c with SMTP id d75a77b69052e-516d466fc0cmr364939791cf.55.1779963132858;
        Thu, 28 May 2026 03:12:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:8e96:3679:b9c:de47? (2001-1c00-2a07-3a01-8e96-3679-0b9c-de47.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:8e96:3679:b9c:de47])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68a6faae4basm1682979a12.5.2026.05.28.03.12.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 03:12:11 -0700 (PDT)
Message-ID: <66a76d9f-fe04-4a72-b6fe-42c2922fe9d9@oss.qualcomm.com>
Date: Thu, 28 May 2026 12:12:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 0/3] clk: Add __clk_disable_unprepare_counts_only() and
 use this in simple[fb|drm]
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, Helge Deller <deller@gmx.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20260527094811.116977-1-johannes.goede@oss.qualcomm.com>
 <ahd4XgTo3KZqGS9M@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <ahd4XgTo3KZqGS9M@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _ivIeXN9BSgXR9Xrap6_sGipWS79ag7N
X-Proofpoint-ORIG-GUID: _ivIeXN9BSgXR9Xrap6_sGipWS79ag7N
X-Authority-Analysis: v=2.4 cv=CaE4Irrl c=1 sm=1 tr=0 ts=6a1814fe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=b01-GHMo7TsF7J3Xm3IA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEwMyBTYWx0ZWRfXzU5Rdnfe5YOi
 tgKOeSyruf7usyiVOJr1fjpl61R7wKB/B2bYjgUlgKCoatRzbXquBeTWecjKykAN+Rn4F4j9Qyl
 aOzUBqAwa9P5KuxPEyuRyFXXuAaIPjqbUjyC+YZU0KuiBlajTGLkcvwfV5MuAeCvse2JGH9L+m7
 aiXk4+EqgDWlcYm9Ka8wLmmALyb12hLQQBXPH3v+bj3I6hCSWIffODt9IE+j8Lfjx/vpZEB1JBb
 Ma9J/PKFHGzfdAlXeQSWdpGjrHcGvYISZ8BOnBPCMasa3+vEqqw+XT8lK8dnPFMGv8AyfYyE/N3
 +kilDh1TQThI+y+taGim1U5d09EldTAumCn5djkWPnoMe5B/Jsaxv56NWUvTtYsKzdOGrnv6/HH
 mlDej/g8jbaiU2dlpV7eF6IZp/5xeegK8Ns0cNiyIwyi/BZx+ar3OhDWhLpNfRGiDD/envLNgzg
 cS/GaGa7xfWbSCWscPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280103

Hi Brian,

On 28-May-26 1:03 AM, Brian Masney wrote:
> Hi Hans,
> 
> On Wed, May 27, 2026 at 11:48:08AM +0200, Hans de Goede wrote:
>> 2) One option considered was detaching the simple-framebuffer driver later,
>>    after the real display driver has had a chance to claim the clocks. But
>>    this won't work in cases where the real display driver picks different
>>    parent clocks then the boot firmware did and needs to reparent clocks.
> 
> Why won't that work in the case where different parent clocks are selected?
> I'll describe a scenario below.
> 
>>
>>    Basically the goal is for things to behave as if the simple-framebuffer
>>    driver was not there at all, because that leaves the hw in the state
>>    the real display driver expects.
> 
> I think the deferred unbinding could have some potential here where
> there is some kind of notification mechanism between simple-framebuffer
> and the real drm driver. So:
> 
> - simple-framebuffer driver takes reference(s) to the clk(s).
> 
> - real drm driver eventually loads, takes reference(s) to the necessary
>   clk(s).
> 
> - real drm driver sends a notification to simple-framebuffer that it's
>   done, and has control.
> 
> - simple-framebuffer can unbind and release its references to the clks.
> 
> No clks will be shutdown prematurely in this scenario.
> 
> If the real drm driver needs a different parent, then presumably things
> should be setup correctly, and simple-framebuffer can have the clocks
> shut down when it calls clk_disable_unprepare().

If the real drm driver needs a different parent, then how does it
do the reparenting while the simple-framebuffer driver is holding
a reference to the clock ?  In that case the clock might have
a protected_count of non 0 (depends on the core-clk flags) and
reparenting won't work.

We could have the drm driver claim the clks, then call some release
function and only then do the reparenting. But this makes things
somewhat complicated for the drm drivers.

So my conclusion is that having a clk equivalent of e.g.
pm_runtime_put_noidle() which just lowers the counts without
actually doing anything is still the most KISS approach here.

With the downside of needing a new clk-core function for this.

> If the real drm driver
> needed those clks, then it should hold a reference to them.
>
> I'm intentionally not going through how to do the notification mechanism> here.

Ack.

Regards,

Hans



