Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38382395AD3
	for <linux-clk@vger.kernel.org>; Sat,  6 Jun 2026 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780746137; cv=none; b=LSi3/TCZVJDCT2Xh1cWdd7nzaGUSdSANU7UPL9s4K8Owa/UPnZMHM8o+iwjPSk4MizDo1U0ryQfB3KZFfO9iQ0TAp9L64/8sRWR3EeeP6DDqYp4i9q6LLWpZQ/7QJS1gsRlsxcBHdSECBjNXx067p3tYP+/sn17YSqFsRV8PO/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780746137; c=relaxed/simple;
	bh=+6QUERHgEfhXYcAYNZDxqv4pAxoO5U7KVL8vYrGMq4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyApM8jYwpw20KIzYkbk6XyXjpgZ6xlRgYonvi2fyXc1glhscxAOJ4zMBgKFEY3VD4YBPai5BsBpEASNxAqbSa1Zh7l99jCTyv6uYaxJo+6m+QI/10UvOhUYwZUpvBb/Ok50cj8DVN7E8XYRqQSu9ToFXT0hRRua1l1KaZZxgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NscwdcSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLsByZ09; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NscwdcSG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PLsByZ09"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 656BE4jp1258094
	for <linux-clk@vger.kernel.org>; Sat, 6 Jun 2026 11:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jThlbYq9gcNtv4SDC2gxLb3F
	Rc4MdnuJPfMHyFkkw34=; b=NscwdcSGNie0XO42RiR0owSD+O88UwbWxa7bkdPK
	zR61tcy3fxxN6FveCCJaouZWxMhLTI+cVotWnkwiH39kX6U3Cb+ihu2OJuXnkh2O
	xOhm9og/T6bnKh3GnKq6lG0sbirf6vMDmrx8ZrjwEuOrrumiMg5CTP9z76Q0xf6A
	e4oEoR6NjiZMR4ERcAOZZDBDzo+IM/PhbynO76fG1WzDhzxOzLEHtLGvhWuIk9H6
	rCx0c9b/EFaqVEbOw0isNaxpx9Bs253dvOO9IHlwgpZzXKDacWdrehGJSQYReIZV
	/GAeqggm5Rl6EcYQ7Q6/Zyhk+ol41xCIMYHpSKyB9q9HFQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcadrsk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 11:42:14 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c6dc39a6afso1726504137.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Jun 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780746133; x=1781350933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jThlbYq9gcNtv4SDC2gxLb3FRc4MdnuJPfMHyFkkw34=;
        b=PLsByZ096ZZTDMpkhC4Qiu0oAHNOsE+SwvP+zIOX/NH9dDLsKIhKox++Tgca/1x7PP
         R2DL+Yvgbjcv0WmIYYFf1/voS6tRn77ur03U2Y2MXvHpWs0TW7wqbNDrOT7r0LvMBipk
         OC1KFPi+RmReF1JyB86PaGQT7Yp9cWFZRRN6wIlgEwgXGRVP+4V3c0jOcYiiWQUJ+huB
         ALIa7BvFg93K/v0ReEJBBD+lVQn4EPF5/TRfclfhriC+PM8ZGHghWtWWBmqGmzfm72ha
         8pOqIsPXHP8PMH68HTcWxvhE/bsifTZHZYf7vkFfbQCQZxSPb2ugBLPA4xw5KY45O6G7
         3kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780746133; x=1781350933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jThlbYq9gcNtv4SDC2gxLb3FRc4MdnuJPfMHyFkkw34=;
        b=e1ze7UFC8S/H1J8/CocxSnfQrJA4CKx320GmS0QczsFWV1lZhGIeMgGmpmXaV105YG
         o80JpTFny6bqBpKAifcwz9LpuLjfcMROLdxi2GIZZu2/El6t/sWAOepgY0wA9YSfM7va
         LBIj58Uw2OzGLE3fK45iYc3WLFg3APQqj4oYBUy1qaWjgCo2mywhoROsuww9bw7YyR8e
         YaJ3ZB1RJKxpk0zbPCzf9QSJinnsCdRp0Oovh9KwuyR2kMqgOmEwdggkN3vma/1Gklbh
         XaCnxnZPrZC0DT4wvGOLjBecwWrZGRLukk4ks7LlDujpYKXc09V5pdWnhJcyIWwZzEf5
         3abQ==
X-Forwarded-Encrypted: i=1; AFNElJ//bV8TQvFSlQg9RTG2PkHqCBXHH9rP5vZQDThJ5CnV5t4fUel0wOC++bZU8dYFdWuITopdGGRN6O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YykyCLDKVaCWzhaN7EWac3rrhM/YHuH1Beg1iTNwmpllxgZy3SG
	H8bz8Ub58TVbEKnBLclc65S4Rd2Isj1lioslqb2l/V9BAdVvqNoqt/Qq2Dt3f6hjx0tzjfwfROy
	b+3CH1kjLzuplY2xjxtIfPo1bw5xBmPY0B5IJJtScxhep980E38TUFT9PORSZxKm5Y4GpYTc=
X-Gm-Gg: Acq92OHJjDN5Ira/Btn5EZapMLHjPF+KhM+awJN+98711EVqfck0p2ID7EErhA5lVpq
	4ZO6FM+Ti2ZApdA3vT+FRnRtVPg/emU9DFTYsrwkJvG0NUX5Py+x+bFCQB3cNWxHHZjBgYyV4pt
	KIeNLBXkUwR7sXba3nDuZKsAdpbjMfhGzQx2qe7Gnsx2l7ZsPzMsXQmYrqvYoSHqeRl0g47zY7X
	BSLsAaUaRbtfhPJWViLkFDJmqTu9wNOlCFZJuWLdEG6676PYk1NkyJH2ChrczwJOca2SSInxHPT
	N1ETx7of5bwoP0oM7uLFikKo1ZVO4AsMtCK1WN78sktAgOEBbpvBVklo9peYqsMif7OtoOKtqBw
	2ZguoqwkXkUjYxkwgJEDewGfb36UdWGZ0Xvo7VqUngUoTMglgQzxyllo/myJcHVlnL273y2bSiz
	3tg245VOw7cCSCKtbB0IBC2mmzFEP7OX9jn2c5Eqx9NC4c3g==
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr4223231137.20.1780746133417;
        Sat, 06 Jun 2026 04:42:13 -0700 (PDT)
X-Received: by 2002:a05:6102:f98:b0:6a2:cf9a:9221 with SMTP id ada2fe7eead31-6ff04530fdfmr4223214137.20.1780746133041;
        Sat, 06 Jun 2026 04:42:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b990d37sm2436994e87.70.2026.06.06.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 04:42:11 -0700 (PDT)
Date: Sat, 6 Jun 2026 14:42:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Brian Masney <bmasney@redhat.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v4 4/4] clk: qcom: Add Global clock controller support on
 Qualcomm Shikra SoC
Message-ID: <gvqubjzscwvq4nmerwptrnojrui26ymigzs3mo5yqordyfsnx5@zxtjhsntbrcw>
References: <20260605-shikra-gcc-rpmcc-clks-v4-0-a0a7bfb44455@oss.qualcomm.com>
 <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-shikra-gcc-rpmcc-clks-v4-4-a0a7bfb44455@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DIa/JSNb c=1 sm=1 tr=0 ts=6a240796 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=qXpo7wsCot1G_wR8kq4A:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: 2mGp38iX3NTvkecjEYYDERyWdpZnFlOr
X-Proofpoint-ORIG-GUID: 2mGp38iX3NTvkecjEYYDERyWdpZnFlOr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA2MDExNiBTYWx0ZWRfX2t1b9YqH8PZ3
 nJK0vfT7dZF+4Jjbi50eV4sS0uZ9yQpjxOUoDQ1kvNz/kr4nxlIZBiiN6wuVDjdMJVfZ8EqUtq6
 ZuJ5y3npxqAMd7fWdyScw0mQsmBKEnWyuf6h0LWWE/OkeQA250csTivgqf7SsFTlb/O3IUcctHu
 ZEy5OBoYFcvyMrKm2Da6l9Ijo4UPCxhRa+zup6uuuPxvKUUaTyfn3Tt0vmUJhlzKKfZqclpQTDb
 LNHOiQtuPpRk081/qz0wWBN40GraIiJk0MxJeHLUbZQzdV5CbzzQ4TUTUVWHaepx1t7Z5/mSVS9
 mGJHgEqDdZV122Lwy9ElZUUK5/kRrwga1JWuSFvUGjVVOPUpri24XUlKXFkf7A7kq/zDOhF4xpa
 F4OsHV7dFCauHAR5lxkxSmT67zJDjYBFh+FuUbRrBRin/zyQr/tScSRxrfTQt0CMIQ2xrxsbWHM
 ZRkky3P3fcDomr4yb9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-06_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606060116

On Fri, Jun 05, 2026 at 04:49:14PM +0530, Imran Shaik wrote:
> Add support for Global clock controller (GCC) on Qualcomm Shikra SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

I know that I've r-b'd the patch. But then I also compared GCC on Shikra
and Agatti. Is there a chance we can merge those?

> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |   10 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-shikra.c | 4431 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 4442 insertions(+)
> 

-- 
With best wishes
Dmitry
