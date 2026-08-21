Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CAE38AC7D
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313010; cv=none; b=U8xiSkZrvObo2B60EScH7LX/1F1pA6eGVKQd2ZQYJN1DnC9W/v6NhPgjhq12U0sT1FeV5ih7vkHvNO3BoIwvOHFrWzlCSVdwVzPGPyD8jHkAC5t36BEyK5nTnS8FhabR6Bf5zH2SxvVUqGHMAA5B9NA/PuL2eBGCZk0bM8BJpI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313010; c=relaxed/simple;
	bh=SrJH4dZB8WJPnAhdN1PMsEGA/ttbP7wUt/fEKp83GOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F98ztnnwnma7myb/z0JnXrh3gwAXhdUj2nlRqaqIRJA/2yeNK4EG5twdYUfaa5aBDj1onRPft2uKbi0FWJd5rQ4CDVDdxU08tVirSKZJVZVVJOUjZS6LL96gSd7Y6tF/cjItBQ3wKyZkrcveDwlUbtOJaOWE2ISJTF88cwH0TJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8PHXZ8G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hMqRocef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8PHXZ8G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hMqRocef"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lhp41983011
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nJAl5S1NBzbKBpbUUBk1SfID
	XbwF4A95DTodMVYzqaM=; b=j8PHXZ8GBdDkM3IDRboI7LKBPbbzwqxs4KnQlMYT
	1Ad8/AXHODvZku6Go6tyiPvS090dopICCRXKcRVyWKRSulcFk2B8bnlWJa1B+2mS
	ZAiqr/wWUdHPcPYq1B0n1RsGpBBya5BcZJzTyUqp1dvHmpgOu6ZaAapBflWA8gDD
	ijP7c6uioQp580tCaWvWUTzTsG59L/X73X+9lrrBiO0z1SRa0LF1Xi94AMHTLn1T
	8wzw9OC41hLtIPwstukmNKdy7mUSiGKZWrYjAbtIAgTvbo/5ggz1dKLLdVUlgl4X
	oIieT8JcD+PvsX9GubSsFg0luJc7pCld50Spzd0X9c+VwA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsj3xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 11:50:05 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97c176d45a2so99230241.3
        for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787313004; x=1787917804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nJAl5S1NBzbKBpbUUBk1SfIDXbwF4A95DTodMVYzqaM=;
        b=hMqRocef3YFaQCB765NAwkyLa8jzHIQrJEbqv5o5i1PeLkgB7xwJHi+RtC3HXTXFDO
         iJJ2YLAa3BpPZDdqMQmh9K6HS5wdpGyQ7uGL3tzQJQhfzgSiScTq6DQutJvq115X5ytw
         I3bTyGbGP86juKDd3pIRVV14XLHQDZA1wCak1H1wUWOM6i+8XPvZBIC/7kN5RM7wHoIt
         jd7/8jCH8V97zhbPBx9RoBgQJP81jSe+s+m2bwXA+KC2I+lAWVB7U9+DdlKZW08EuPK3
         ou8qKtBBfsTRyCnD7mCfhz+/cu6ziBeYE0ZmP/G4nnguxTKqs6C7Rr7ntZHr9viCGFJc
         3qEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313004; x=1787917804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJAl5S1NBzbKBpbUUBk1SfIDXbwF4A95DTodMVYzqaM=;
        b=qbsuvvzT2nAtQNFuAXi5u3QjvpJ/MURtXvf9HhmArCMXCSeBIB+PjDcDPnlG4r+RIq
         yAcWLcKOR/XxhtULxU6yfhmSNzAh4eEY/9w1jxpPge4qj8WkqlhczTux0h8ha7II2pbN
         q3GAxROaYgNl8g2fLWjENCZce4otOyjAUid5dYLPjnF+8rAs6Jf7yg8L0BNVHYa+V+AT
         6AC0JQ2qjTrXf/cmKHgm3kfbbGUYGpSzVRCyUAYSW0I5UOzE0mxIt6Sjv3UjPAmBa1CU
         /6NHZ1PsWFVBhp+OUbR9RtvWMMkVVaaZIilSwFQzqUySmirTIm+ds/iyWTlKLFv6NJ9O
         dEdw==
X-Forwarded-Encrypted: i=1; AHgh+RqpC0LrkwjIC4LMiWtwj/SbvWTtX6fZll0QS0LlQ2Nq/eNbs0Q0NtsWYbcMvJG6nMc0h9VyXHLVi1A=@vger.kernel.org
X-Gm-Message-State: AFuF++mPzPlYOIJ4gBBdqSSZqFBqtS+X9ZpbbIZcTnX8xXjJSDkG6H6Y
	huRaBXFriHaSLS6abAGsy3zRK10X3cVD4skAs4poqKPSmzWpn2yxvt4MTYd1ElSnFPJ+rCKxk6e
	bcDwDk1FPWRW29MVFM9mYS8UUreAYVDM9TBSIODfJLRyCS2bp8oCQSRoWMGXrZmc=
X-Gm-Gg: AR+sD11VZjtSMO+knJjaEFjsoejj6Dkr8Eyjm7B+v5DEzVMK4mhZ23Icrr+vAhNhUnu
	b955skwI9/EUNlVprtrMEe/sOBZ+TDtT+Pokd0LSOCq2f1l7gsA0L3EJRjgTpI/JG9z6kC/AAMR
	5y8rqPoiEw8+5l6uDU8dpXzlFaKemDEJbZfb/5weM6J6LkzuagKn4WIXh9GLAj+x2/FktC/M21K
	XRAcV/3hEuovJqyX4sAZVkqdAiuDDMeiZqEGv0mYw85A1KQQ5zXgBfUEAKU7f7rClU/9wM378oU
	mpz984D7RtndsZG3eC8nQXKDC2GgRYocZsnZXyJUYR2RuFjj2NgsqMUSxE7kLoc8kTkCwvBO9s/
	PLAo2fHu2mjME+RM=
X-Received: by 2002:a05:6102:2c15:b0:777:4f1c:15d with SMTP id ada2fe7eead31-77a64d6bd7cmr1880880137.14.1787313004179;
        Fri, 21 Aug 2026 04:50:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:777:4f1c:15d with SMTP id ada2fe7eead31-77a64d6bd7cmr1880848137.14.1787313003628;
        Fri, 21 Aug 2026 04:50:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff158e82sm5959426a12.16.2026.08.21.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:50:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:49:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
        Brian Masney <bmasney@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: composite-93: return timeout from gate enable
Message-ID: <vfm4yvruim675ev4s6jj2bkyg7zjoifpbdsk5ipvrvpoqvr7yy@c5voyam4vceh>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
X-Proofpoint-ORIG-GUID: FbpZUSyKfhny_dTtbupwlZUhqH4TK2C-
X-Proofpoint-GUID: FbpZUSyKfhny_dTtbupwlZUhqH4TK2C-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX+ZdfsoVNnP7l
 SibH2wtPYGhmqpZ7RX3TQtdLUZIWFdbyMTHU52PR/1cysesRX7eJTaLasnxZKdNfVogKAzmOAgO
 Fq6Sn+qx2SChEnF4JLf/y9wobLQqkbs=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a883b6d cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=NhMZVuV82ezdd5x-88UA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfXw3RhifIVpL19
 anP1LTWtLo+ktvJCLQBKSI5VG/134Ay4/HDp+suVoaoR7IEhuGkXkt83MLmi/kqGDK4UhFR1qqr
 Z9flDomdt6rXy/nOH2lCXcfCBNwigAccbweTEIW05I4C4wRbc1PrqELiCqeyFMaW7LH0zugeyyN
 7OQi40pQ4bSa7zGk3zQRUaTY2G1eIUJ1uZY1SOxBRrQEtkzvGZ8G4MWsLF5do6ZAhT8+bBQWGW4
 9yyVEWD4u8BSaVQaxfVRkD1O1evnsG4GXE9ZhVOc2WgH9SC0Rs4QJ9eJWxP0YmUM+/f67Tw0KY1
 P71cmzmgQQNkQZogeqlKA76jtC7F6bzK9jYTY5Ty7PFPkdNGTIFN8IY/2qUCllqZTNRiJFbOY01
 gT3g9SlBHhZhlEP6deyIztEIDKdR4HklKifvg1qK3he6OUkIZhJVslPXAEVuIOz6HX5GkOrDz2D
 guINH5JcmoFa0/U/aBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210089

On 26-08-21 16:56:16, Linkai Gong wrote:
> imx93_clk_composite_gate_enable() always returns 0, even when
> imx93_clk_composite_wait_ready() times out.
> 

Ok, so you are describing what it does, not why you are doing it.

Please make the commit message a bit more clear about why this change is
needed.
