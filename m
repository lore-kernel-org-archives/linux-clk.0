Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B8D549398
	for <linux-clk@vger.kernel.org>; Wed,  9 Sep 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954304; cv=none; b=D2CCy+bLtXYvsVxIKLMPFyJDMUVXrTHxS09gaXDVnuf/ACNX1VSzQgvBWqdHp683VNB7zUj+dB/iibifhpbGMlEKXgieZHV6S0qYLpHfgySd+/d6Og/UAJ5nKhLABrOKbsamm4+e+SWBTQcOKbtb9fTrsPagyQ2Awr6gZa0fk2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954304; c=relaxed/simple;
	bh=A8fbtECilXcXT05bGS4gADzn1R0DQYSuDpwR36o1s6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKanhDR5bEswi7fKiDqcKJe+hElDDNOPDbs1qY/FeifPZLtCqYC5Um9X536GUcVNFCTGzRW2303w2hjzmKBxy8aZXTb6t5elzuudigLtvE7ncSg06/+quRC7d22LSqjgnOZy+lien2Iub6SzMMz1fx7BX4OQntRciDbRZB4rB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbEM89a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNo3TXQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbEM89a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNo3TXQN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUFAS2654107
	for <linux-clk@vger.kernel.org>; Wed, 9 Sep 2026 11:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/BIAcKnu4PYwR1yQKunqDZK6
	VZ2d055y4cTbs1O813g=; b=UbEM89a+IyCMUH8fbe/ZDcIHuOWqydmjtSVvoiPm
	Nl96voSomED5T7SASKY78Nu7lWVixAZfc5oOlFGGD1QVPNGU05kouUJmmwAk0DzI
	ATho82FJYipFdvlWvMX2yLKHcxHUQtmrRHfZCBGvpQouyFO0fdQXS1drVJ/Vfz6n
	m2w9swZscbvwaOUSZN7xC6Vg2wzGqV8EU0rrova5mF3hFwE3ei29i59Hk+IKYwKH
	LXcoQWt6bVQtuWNMf7LBf62Ppbk/1OEqmVOXPVKhxct1LZjbwg39uJnblC+7/oTy
	Rs23nM1smCaSB/QgBsIxnxKjYSZ+EqnmMgeV42j7QCvMpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha3u6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 11:45:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390a2c895bso1168516685a.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Sep 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954300; x=1789559100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=XNo3TXQNdsfvmbJ2lt1B7KJb1Iup+6EHNk3v9thbIHlCMWq0PzGaS7ONZUjHoiLczH
         C3G8ek9argm22aaihCgpCQNCjud8TePXXfN6yR4ccPGWxMgaY1k3i8GiQevNH3MeUOIJ
         Dxx5jpHpZm6vQ5XBs9q+PoK9wdB1aH/k7nZsCFbtgYa87645eLcsiQYpmMJwu4toYMyT
         52T/UnNnJC0KBGzQtFJBvO79dlIYzsdMkGc6ZtXuI6Puil2iS/fzXRyRcBeyDbVWw2LJ
         uo4HLMb3TWs1h5e8+2/8GwW/UwG4MrMqOYLTObiL+qpJyfN+wZCvVCdkxSWMVScLn8DH
         8eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954300; x=1789559100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=TWx5Cc5ix5IRe8qHk/H/h4qDLHzcwTF+qxUuoiEjMgzJ+qKHmyZc5LUT+Gehv63kLQ
         u3H5G/RNWFyKGMwqQY6fGHx65yiPaENG798IXnJw/+XkW2a9YP6iiM0xlNNwQI6o7afi
         jGGH5lV8GWc2aL71PQ4mQpLAykBgDDjvdTpm41us52/6hznP13gSCrswkxqkHZpT/MZ6
         Po5L/ewsumok+l4rkDGeQqp61iquE70+v4nzYgilRNOE42KQvafbicWUV9R3yTsQkmhk
         3nzMP9OxBOrjEE7noQNL05LVSavtpzlJesAXt6M0CJjYAqYYFF4Pb9UI0mIXqVu4dpG4
         6kxA==
X-Forwarded-Encrypted: i=1; AKwUvBxpaub2RkxiFCNMYQ8yxY1vedyQcfc23MvpV+wbF5KF5Sm0euS1VYQFnTwRWjnGtg5OPNVTIUUo9ik=@vger.kernel.org
X-Gm-Message-State: AFuF++kLhV5sWnlOyUzOYnZmh/+uJoUDW5ATk4HjR0Hc1GhfkGZOjENd
	A49onJjeGczWcL/RaQ9KjKFUFbQ/nej9hXddkotiMf0LtP7y21XFy/GKDAOpHZkpoqVUbwsvaMM
	u3S476Pxqv7qNLRkqbVN4CE41KM5Q52MQLh5KEKWE3zM80RZpxJnH6IjXbzxx3vM=
X-Gm-Gg: AYBFou3LejrdPxTVSJDoRm3Jrf0g611EP6qz2eOSwx4wYTWlCtFKica2Slqgjfj+dWK
	Ul2jM6f7L9bH1Hc2SYrlWSMqkfimJTZFdYfWVqCCdqkTFkGntGOIBaNnUf4CsbAxLgQPLOPjazz
	8rVkxUgF1G8HKCvXe3VwuN0N3Yu6VamJkO+kWpn3ni2fWfXC0Zywxl3vo9gfprBYXfJxIboMHtl
	T/BSu/v2lEtdvRZ+NHKcoPYtSgg8nGX1NqW6YvZPSsXjLwLvJCY9tL2N5Av8uu6qs7l9Jc/2YPU
	3+Gf/+Tphm1etbEybSHwnJathnWUYP/qhN+3tRDUdPqRkfOGX/LC4As5XeHEdlrb+Aj3yog8zuh
	H+Et5o9kX1go=
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934360085a.52.1788954300143;
        Wed, 09 Sep 2026 04:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934353985a.52.1788954299549;
        Wed, 09 Sep 2026 04:44:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm40029685e9.0.2026.09.09.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:56 +0300
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
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Message-ID: <eu2j6ohmt7yrhkvfcwiwfdcsebezdi3rr6vokc3t44ynfucuew@633443hrwqwf>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX6H+ipGV2gzBd
 NLw/EAmF11Y4uGCHTG2Mu/Mn61qWPlNFK26uaA9VXC3cM2YSmcm1X3nGmGpEVaMCdKtILLnkfUu
 qU4O2yny4K0ZqHDiCHuEvuECx4TCmyQbIeI/X4/10KtafbtDl9131/2jRy3ZfHA91Ep6kMzpUP+
 s2B2pVFjbv9+bShOpyqIAQMPHbuHGJrhTLVqkTcJ4Tu3HCE4wGihwljK0WBaz7CZTFm8ukNBuUE
 WAj+l9nt7ftDjyquY7XzdTgFZHF7neezmeAF4iQqqeGG63XbR8pm/2t/0T8YA3lloa6lRFZpVi9
 0lM7JP1XTCNU9JAisvzTf3xsaJ4CK10vCR2Ybit4dNw1X5V6FezCOvR9iuSrypCtlnt476elizQ
 6+DQMhgpP5VtgaJksbfUemJQhQjWH+GnqLAwJhOVBZlOQQcll2Vw8kxTXpbts2EHOjYhM0t6dqZ
 XpUEOpyZLOkhOV7DF3A==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa146bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=7ud9App8h0w1rxOIwrsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: TwHmxIrWuSsZGWbklLh7CbDPoaHxlEZh
X-Proofpoint-ORIG-GUID: TwHmxIrWuSsZGWbklLh7CbDPoaHxlEZh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX53gfU/vOROaq
 tR/mXiivBpDQH/RovYG1bBgfciw1pk2XrBFunVYuBYrBjWESOaqKrgh72FhDmMRS3+qXFCfuuQp
 XLmmN2ivbAn0d71ZAf4KAS8LjXgG0zE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:19, Brian Masney wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
