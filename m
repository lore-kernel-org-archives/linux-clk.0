Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4F83C3BFC
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773757213; cv=none; b=clmtQJx/eFUxpwU8I5k4UAobcae1j+pA3zcP6T1eOqCUzeAz34OOLUWn5LW/VDg78yipV15Q6Bq/sW1o0P7AoGB3oWlnolyXK8Hn8nDRj/iYCUrn8rTif7TAbeF+/tPgLib8CaDivaZC74mjyR/SVN+/yZdqpkCIR6/PT1P6qTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773757213; c=relaxed/simple;
	bh=h8RokuzQTmpUInbjp48eFI4p729TuWFXN5xxFkUYsyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DFCxSdNwFn/xtGWB6GeTC5m4yDywle0SxDIgdOzj5VS/s/lXADUgfbQPWptXDO1lD2osmelaMCkBX5XID6NMgF/KEy3JJtxGvoB3/TsGtrvWbKzt9rZbglw3Mc/luBfj86JSWtlYz2EH3iUIc6U9mPUNg0TcsBUfPgV/jjZ5fsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2J5+eJV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+eMRKHL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2J5+eJV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+eMRKHL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HD01Y91639402
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 14:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UMe5FwLKUI79zakUaymujYWJ
	qo56zT7hQ3zo7cK1/jw=; b=U2J5+eJVv03wRwdAgX8CYwqHMCjvlRVyXm+tONJ8
	qSmWZg87oXdUgTqK8FGYeKra5INhtX+FUutx/P/t19mrxCaco5s/+stUD25Jg4yM
	rySEVVjS+O0ZHnBYerZG90DcnQBckL16uX+iYXy8C7WEJ8nISrJOebH39cY39MUZ
	GP2gJNMzY8HZVrt3ot+d38VDKG17LW4OGgRPAVZaYBy24ya2JDRU3eQUcW1FrYGw
	k7rNvh6SvlZqUpHMPV8muJaFzUBAh7bWv0nMv0meY/Pkc+PYok06aTlLHvyYiNpy
	cD/kFyIJIsptDeHoLW8ehePD38WyQYta5yBz8KBw+uvMcg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxke0ckrf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 14:20:11 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffaa511969so7988820137.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Mar 2026 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773757210; x=1774362010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UMe5FwLKUI79zakUaymujYWJqo56zT7hQ3zo7cK1/jw=;
        b=D+eMRKHLRYTNElgDFTd6FAHYdVYohW1t8FcWDri7kE+K1/9VtHOECw1AFihWIzPlWT
         1VqcRoEy4xzVB+erZzed3o4oKZmX8ntEIyexn/68GB8orrxxz0f+7GVMF5GZUh4Vm0tz
         Cx6ZsQFrGPDAQPwOBZvyKY4FGD5r7QaMj3YikbnYBgk32uPGXEIuDZWkz2TLxjtE2wjt
         e21gHZzcyKTR33dQFJndNR/W8PBz5oJKznYCz6USvLZ3sSnSGRzWDxLLaX1FLuURpSH2
         uy5UZTNhDy5RdWSDE2Jj/wK7KeV8jRmjnjwdL9ITPMK/QM5bDbl6CmOr85anTILVj2Wi
         JjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773757210; x=1774362010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UMe5FwLKUI79zakUaymujYWJqo56zT7hQ3zo7cK1/jw=;
        b=OESkSVlWswczZSe1etYRILhZMw0CWYNXQHut4PTWILpmpp5pK0TIYpPnaml0y4Avnt
         u6j0Gi+ESyLZiw0+eYHOlsNIBZG35S7V61XS0nj/Noccs1YUSatMDgDHOcyAErgk7gDl
         TIX8vaQZqmdXvwEdZPKfAF/FMUsZAa71Tu4YWXLnSqDQyzFghTFeMzIvwIPNmhW3SzoH
         9uaT4k3aHrYZZeDkvpy+u4KzbeDkxPxeDilIXftB3E8Q7qE8rlRG+HiAL/3/vO01q9UZ
         vkBqGMWHT5MYaiMx9H2cGt4zsuraNKK7+Al6Wj449lFfKS9gkO7g101pVSfmeHNLJ+3C
         yGoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTKX5iD94cSmU64FSRkenenf432v1kArSqn3VUVzirybRVNJT8LEuVfAg6w8VUPHaQ1HVbOVAV3sY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw39b1pgeREuHsiyOzmHQydr5isart9Z1rN/PhAeMlBgS+lIFxX
	O7zMaf2at5AT8xWvF8bRiK1UruzmleX7DJ/6HEOd32OWccv8HofrOAtBcpldkS59/DFhMPeR2u7
	6Xh+u7QiT/mP45qCRZqnSkdBNFzDFXKR5IVtDLqHTFn9+kJTiktfJEECnLQnCe8c=
X-Gm-Gg: ATEYQzzTvYXubTD44HoohvYKDWU6jDyQuEDKw1hlAf0ozdl8Rm2h1iKn8TQPayenIFW
	arEzvxug2fMdpwGK81wTU0wrzBVf+gnh8qSUFw2K9eXOVdACEpjDUyUc4ZX2iXsHRW5MZs3brF6
	LYyblPdN+ze7q8LcrFY48x7JYW24FPqgngFVoK/APcR6W6HxKIz/HaaiaWYiKX9OU9v1F98k3Rm
	OXSiKi4z7f9qcKef/dNUxalLwNiZmUiaqT0wEmi70ZRJPY9KjbhmgXaY3EfGREEtJLPTrKyIVtY
	yged8WTQ8iDjOrQhvFEq2RsgElu+IA8LRwNYwgpIJ2zu/aRQ5DBq10wQrg4jctJvqPIeTQ8vm+o
	ez3rjohoiWRXeldveRyCJuF6brC9MBPgl0w==
X-Received: by 2002:a05:6102:32c1:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-6020e5f6a8cmr5641701137.27.1773757210170;
        Tue, 17 Mar 2026 07:20:10 -0700 (PDT)
X-Received: by 2002:a05:6102:32c1:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-6020e5f6a8cmr5641681137.27.1773757209549;
        Tue, 17 Mar 2026 07:20:09 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556422338sm122583015e9.7.2026.03.17.07.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:20:08 -0700 (PDT)
Date: Tue, 17 Mar 2026 16:20:06 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <hdagvfcxoh4nukz5sqocbp7qbezv3rxct3aygb7fvhsej7zp27@iyeoi74q2w7n>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
 <ablhdKJgEhU8KmtO@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ablhdKJgEhU8KmtO@redhat.com>
X-Proofpoint-ORIG-GUID: _4xIjIBoR6t5nJWdV-_o9MYWbp46w7bs
X-Authority-Analysis: v=2.4 cv=aue/yCZV c=1 sm=1 tr=0 ts=69b9631b cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=aJ-NGQLJV4KphsafQ0sA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNiBTYWx0ZWRfX4NTkx39I40W2
 ghnEmU7zYwwm8npkbpAkbT+gdr8Pw/w4pL3mhE9pFZBAU2t9JebUYAVHdqw4X4n+9b4mOwz2viD
 5ulqNeRcAtSwukRwKBKzRaRXKt98eBWQ/QpFRIOx2RLmLKTk/JBNk9yG108HiAd3qEVhzgoUyhC
 jvi3W8n2ysHqnWZffTybFM5XaA5TyC7bQyQJTifEU0WEtuhuWcJSEhkpTqY9qpsl+cm/BQLGLME
 bV4BeSXCA2qFmCWfRnkIncgyeopP2MH0PmQtSuO5BqgvSrAo9JvUSM+6O0npI2yGrtrdPzdoh+r
 T04SxbeHEhT7QnlxXAZ+xu+HTlsFjoLQHs4Xy4dziMu4g/ZRNKTcOym6lIKTFdZrVrb8IzAXa6f
 H853C6Se05P4fyMCnJ0zDNR/P1zAZpDdUuSAui+aH3TQ3mqRCXoc36kdJwujDP0Php2sS61UMYu
 OL0zI2sLmPH/shmzNvw==
X-Proofpoint-GUID: _4xIjIBoR6t5nJWdV-_o9MYWbp46w7bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170126

On 26-03-17 10:13:08, Brian Masney wrote:
> On Tue, Mar 17, 2026 at 03:21:17PM +0200, Abel Vesa wrote:
> > The solution has been already discussed for a long time now and it is:
> > drop the clk_ignore_unused late_initcall entirely and then make a
> > generic sync_state callback that the clock providers can use (or they
> > could implement one themselves). This way, until sync_state is reached
> > for a specific clock provider driver, all unused clocks remain as is.
> 
> I'm willing to work on the sync state support once my clk scaling
> series [1] lands upstream. I believe that Saravana posted a series
> related to clk sync state, and I need to look at that.

Yeah, I've spent time on it a couple of years as well, but got side
tracked...

I'd be nice if this actually lands soon.

> 
> FWIW, the only reason I posted this patch is because at the end of
> Stephen's LPC talk I got the impression that this was also an acceptable
> change. I'm fine with dropping this change.

Here is the scenario that proves adding such config isn't the right
solution: think of single kernel image working with different SoCs from
different vendors. This is actually the case where distros need to have
a way to provide one kernel image + thousands of DTBs and be able to
boot one each one of the boards. Whatever this config is set to in the
kernel image, it will not work with all platforms.
