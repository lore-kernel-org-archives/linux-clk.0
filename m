Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A9B51813B
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988465; cv=none; b=h2NV3EP8HcEQcBaI2P9zMLZ9DOoeGoEBFgqqLRAb/ZWXw/Iis60fSMeP9JPj3o1DyPIchudwmX9P72gO1xNdFziUx4NsqmOTqeMN5NVejyu0GZVpRpOkrJewmvMeGHvDvbPT7ejcXSmHQrB+3KpXAV+c+9VYc8ecfj7V1F9NAlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988465; c=relaxed/simple;
	bh=AhzWaDvUIwAHQ+BlQRnKWnDdRRuOjnRQTjl4pNt2kSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrBkCeNkwuYwGQQ1FYZXdKJWORSrM5a0/YklmWWWsf5CJQTcDDS8iryCJN44qkiEQm/KEMPswx9K9fJydNjEnehWNghyb6K2ms7202AejO/yq+Cd4HvclYck8SLkzrp0OVb58i9tFCf9etzGFoJKZKOzi0FiwG/7dXKYaQGlSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dM22UACt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/LFWZJa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dM22UACt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/LFWZJa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EBRQdr2516002
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pkVhPqBAgtTYGz/vDCDa9cYD
	J9dul80zJVTym9S6bp0=; b=dM22UACtsytu8da0dYk/ABEptDNJRsY6iclP1dD/
	vPYr02ts2qr8AcnqvUA6HoDcrjKdZ0ZkDEXd2kXf1U79emwtqXCTH5m7bIj4x42Z
	gF6deDRHExI1jMAfWwMW0vVRzs1e5hLPWPJjMaC1dF17BUtfgBUZnMWP43FmsXah
	AUHCHp3yX/YHMkJMN+G3hLIUj6uC5wKHy3dZ8vcBS9wNyfrl/672a/eRc/NXnog7
	S5Rod+/JLt0ULJxCW8/lnS1eEzSTWpK5XTjFwETz0AFNBF8shmQ5ngUyKRL8A8en
	sMAncAbPlhYbEdSt3JEnBb5pF/PvK8Mar6oFE9ene6XTKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470a0xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 14:34:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso781269685a.0
        for <linux-clk@vger.kernel.org>; Wed, 14 Oct 2026 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988461; x=1792593261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pkVhPqBAgtTYGz/vDCDa9cYDJ9dul80zJVTym9S6bp0=;
        b=g/LFWZJanf/PJ7OSazNqQtZPs7ajF3Pt8rA2iFHw0JbMzLpZv1V8EUOCUJwi9gI/Fk
         ryqX4FH9ZAgECAqKsoFaoU3EnHXI4V1oCUewGg1HMk/9wl4AYj1floTjUfh77uZrOJcn
         ZqaagYBKyRC6pi8HqgBEv4wkGf8P307dG+xVFsxkxlogT9zx51QlHLeG61sRdLGg/yD2
         4N8C+Bg1DLQa3i3iCTW+tc29extg54wVqEv8TKxEJNmbEfcd2KOKDI0ecADva3QXTiDN
         +KjRQcaa6plfZIp0GdkWMiuoFZVRue2jVLdpiRefkqncTHllatWIdqjLIHtKpblRp5hG
         uriQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988461; x=1792593261;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkVhPqBAgtTYGz/vDCDa9cYDJ9dul80zJVTym9S6bp0=;
        b=CseStHi6WQI2OhhYlsRE8Dvu8UlCsRjq9sKZwtWHdGuKSslVo3YZlwSguCJLPZQrnK
         xJQQmMqfFaLnYfEg9OIovD8a5PDmRq4jpuoN1dVdIVaXTaFDMHI6/qfaNmg2iBIPXucZ
         s9RT9FXhr2PuFpTOV6xX025vlydaO5HYlKdwqwZqDTBpkWvY7Y4tjFrOyQ5uSqXpK4Gm
         ODQwCJcrGp/SN1h8Zz01S+nXREa6oodwHoHV+0F57KLqBK1uOOjBy+bOrOxV3n8XdNqA
         FwNMKSUHj0AkvKQzNMcbKCTLkHdBGFn6kc343yzMfqdYTBf/Eykf9HXQgB+xfGqWPTXY
         mWTw==
X-Forwarded-Encrypted: i=1; AKwUvByVhSUWpL/qZBM+ZtsXGsVtu5/qCLYejo5Oly92p79JAAU9JmOV4xFmF3JfPBhQm4QqucI+OU1Jypc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhjgU/rLmr9Zc7eNixEuK+D3Yb9SOKDr1h7GMa726Ho7Sjvvkd
	EKHgCRYRX9+fXaEFe8W0y/tay5HUHIFdZDkKpGL9xlINfh3gI55oAz9mOSJ8VjmEgg7cInb8Wt0
	j5saPSfYmSrj8+a7cP6Nmx8wmrFG7k+w5O3yYhQ0ZI1eZy94eFxHLwvPceZ60fR0=
X-Gm-Gg: AYBFou2DwYQGD+/NQVSDxMVPhLHoQCZJGNxj+kRPRdN2is0tnK8Rk47WBjJRfIsanUV
	CwzpqfXQ+oBm3rUvyXzfvWV9MdEKN81DRiFjYgvbOgFmH/HURsnCxFRapR8f22AERIbWVrf5vft
	dP9bE41zRrpuadvII5ugXv0rHJvm5Ow/SGvwC5TyOe6ti9scJS7w+4EG7cjpjsrgzMCqYLakboL
	BSfnl3cb5aCfzhh5z2rqdnbOU1bgcoEZIbrYhcBj+GHPwLhpE86rhHkjkPMZ9mKMM9ubuAZe2p7
	PaUIPasEYLCQdAPLIID3M4EBXdyB+COS9ec2m0LTLeHmUbdq2cTza9lAfYyZj+N1aSnSouKi28Y
	O9fyS6KwFwFqvTTA7XuLaySS8LA0Xv7b5cZQVqT5AGdWc5y6A6e3rroZ3WADDlAKrqod3xJBT+8
	7xbdfdXqoJP/e6
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2667925385a.23.1791988461329;
        Wed, 14 Oct 2026 07:34:21 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2667915185a.23.1791988460587;
        Wed, 14 Oct 2026 07:34:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d88252sm712070e87.52.2026.10.14.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:34:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:34:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 11/16] clk: qcom: gdsc: Make GDSC parenting optional
Message-ID: <543k7ybncixqqdzyxhb3mnal4k5ethrsmutrho5yo4vcgxiddt@a5hisvaogznj>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-11-3041b788e9f7@oss.qualcomm.com>
 <lx5jywz6pnwfcoczp4z6k55qeol3ruqkyfsutngmg6n3xqnynq@6jgoutrnav2f>
 <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d82177b4-8e93-4818-bd4d-b4f696396373@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX2iz1TkX28C9V
 2ix6018FHqiaHpXnh96b8+sFv915FPsUm6XyzzSEC7OG0l8Te3cHUA36QV+pcZ0+af6dX40CnI4
 1L7pVsTWASoEDN1qo4FVqzHhyxvzyu4JFFCCgYN5df4Dlctk8Zp7eysrguILL1yvBVelfk90zVJ
 aWR+6JR3LE7pMNYPlOM9ksSYqf9T8ssHzO4cxriOb6EFt5XKOeIfpeQoIcOjFzPHlIo6VmvdZVp
 TONBp6qexOeB5A43VkWC36qT1WZUAEkl47i2EvwFkdt2OVG5iwcdz5TtrsVf/Fz13GOOLvY2ClE
 xF2orrRHMbE2WWpQXlvDyyOzzfdKhQRew+xFvKWFlP9YOriK+goMPjDcuS+Qs5LCXxzQC4bC2Gv
 Axg8CnPBtAcW2hXvndFIJ0+IFtGRbiFFx392YC6lkAUV3/nvJ0rj2rjfPCiU8esMuzBTsZKSrzR
 Jd3Th+L0FRTO/PIgI4A==
X-Proofpoint-GUID: tvjO_4kMQoFpJPo18I4SsKw3IfF2xDON
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acf92ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=pb3S4GdlrFqZhq7q5XgA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: tvjO_4kMQoFpJPo18I4SsKw3IfF2xDON
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXxnN52o8/oeG5
 N0iotSWtvcuYsw2/3CHH4v08v/9EIh/hkCj0MrAA6uCHhiaex2AQC99o5s/nSJVKwOYbzaqUwJV
 En6Y0o5hhdZgazJbhbRdP/TZhbbkCf8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140057

On Wed, Oct 14, 2026 at 04:20:54PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:17 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:11PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Clock controller power-domain attachments currently become parents of all
> >> top-level GDSCs exported by that controller. This conflates resources
> >> needed to access or operate the controller with actual power-collapse
> >> hierarchy.
> >>
> >> Allow callers of gdsc_register() to suppress parents inferred from the
> >> controller device and its attached domain list.
> > 
> > I think, each GDSC has a parent (in the hardware). If we don't represent
> > it in practice, we likely need to fix that.
> 
> The next patch allows setting a precise set of parents instead. Perhaps
> this commit message could be improved.

Or the commits needs to be squashed / reverted. I really don't think
that we should have a parent-less GDSC.

-- 
With best wishes
Dmitry
