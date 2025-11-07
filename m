Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7286C2F362F;
	Fri,  7 Nov 2025 15:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762530951; cv=none; b=kNu5+DeA5KFozLQUJ8FzTMIpIiQBgz8DXWCortQ2+FvZ5srFC9EF7GQhgt2R+MDtWf+vujQu9dgZRRJizblnYWUUoWLMtJvk/Sur3c7HCra5V/vlnmEtgaEgMXeOqj6hJV84J7fJUY23oCsAHPYzToaNSFm0P+gYDDu3SuKBbNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762530951; c=relaxed/simple;
	bh=D9oq68VrORbAYW4+VlHxCsq/enrwgz5myr/oEzlR8GU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jY9SkpWqBaTYeUDqbMLF17tPhNn2TKcFxDmSlFS0CfMNE6gBmFVNzxsK4dF83L9qQebl/kQlJQPr0l3uajTLuuWc0uOgljX1ziZBca2XbAQIwCSt25nvIe9cYeYmTVMXuNnrmIR4kopG1S7hd1Y2PcAVlz9pQ/746HJZ3kKYQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xPw8NY22; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xPw8NY22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762530895;
	bh=x5wU+8XhNn87+1HQLINKbrKQAzx0N1ebWVPXX+dgJtI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=xPw8NY22mzC3Ek/DIkaAYyEPu261K1jn7dzd+xaLLQ80tD4SRWpmIcMqmOycInKJp
	 Hmz4h1xicEmP00zC3QW1EiSgKsStDqY73Y0jPCcC5+66dKrv0FdHNl1ZTxwjTGJ4PM
	 BZvf5QrhRdPut3XQTCyB2ij4ZtbHbj6S8Nx0mcKQ=
X-QQ-mid: zesmtpip3t1762530885td6bbd925
X-QQ-Originating-IP: AVnxMsCEYCH+Te+U4txA0lr7Lg9JiGfupg08FrYRM88=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 23:54:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14462180775243901098
EX-QQ-RecipientCnt: 16
Date: Fri, 7 Nov 2025 23:54:43 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Xuyang Dong <dongxuyang@eswincomputing.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzk@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, bmasney@redhat.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
Subject: Re: Re: Re: [PATCH v7 0/2] Add driver support for ESWIN eic700 SoC
 clock controller
Message-ID: <AF4FD688167B825E+aQ4WQ7qbYqtHbSKl@troy-wujie14pro-arch>
References: <20251023071658.455-1-dongxuyang@eswincomputing.com>
 <1abb85b.c11.19a582bcbbc.Coremail.dongxuyang@eswincomputing.com>
 <039a3a41-c60f-4296-afd9-2bf3467574ca@kernel.org>
 <6d2d7ddb.cbd.19a5cf92465.Coremail.dongxuyang@eswincomputing.com>
 <1618037D174FDF5F+aQ2hU1J9oLEKCq25@kernel.org>
 <5a9911a3.d09.19a5d8d32cd.Coremail.dongxuyang@eswincomputing.com>
 <6C7E97902D2C1367+aQ3EYikxWNtINfyj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6C7E97902D2C1367+aQ3EYikxWNtINfyj@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mx7AiMmSgXkmft6XAEvByt6G36aghN8w8JyyIXoHB8vKBLH1P0G/+FhP
	tdTYPHVBiolV1aOmfp1D7M1IpoMNhlL522lHagqAwFVvDgwMa/viL8H/NOAKeTTMTNAQTLC
	H6d4t5YjpwgHWjon2w4Fhe9/2z/GEZUWGBDmfwLxd/rPceC8F2TYGdq+ZcWmE1YzunhDf66
	lic3fpCQiJhN2sY9a5oNKiy2k0zfvP8TjCNgs27wbGocS52ymrNDIS283IbrxX0BygeJYRg
	nQMIR8/9OE99bfjJs/alebn5XzKizwEiIr+dy1R7AMu/hMuAjUuAkrszVMdH6xzYUTu1ifg
	3wZAuemoHCkcgd9Fb4ugAfSbIF8ssXWQhhsaOjilh5dfED8e3/xqGThzlXGt2S19V8AsgfM
	CYXy7/SAfLDrgHuBhQmErmx7+eJzgA3zHi09hSdViK7OCGVp3oQ3zxh2vIlvdboTVR88EyF
	CZTGHOUTOsVk5L36KcnJ3Yc10am20hh38IGTcpf7ldVdt89/4d5zUQxp+U9oCQM/15iq/3l
	SHHJlEA1mWwnOH26O1X+Fty/BYRWQSmLPInsd9Jc2ZRFv7B15iP4F2hI0gHCr/DIRfVsa//
	iQdotmB2Mp5itlvMvrK22sYl2me2ln2yIrj6xCOCO0VFbfiQhz/rBGttKqGuC9D0SFHMkye
	3uDtNTJ1R+klVxzgkXXTVqiBzBAlon3dyy/90GcoWScVsU2CqGxtetOKbIbzW9Xu0IYrFTL
	NspYvUvori18UEBftJSp3H9UfUP++FZcBvv6nTOF0+Jch//19PFyVbMJipft6OZMPGvfClc
	MGF9c3x0kZL65P0XT4B/2MzyZdxKDAZpNI9pzq5QUV7URrb5OTeihG2X0OsCKaJqIRw8KUl
	gRkY1Dw8QKSOJTxF6dM2AtehL5TspwC3xx7rwdqAMseqZfM9NXyhw4+zLBXH4VyVXA/It8o
	aUvSyT59Lzp1LGh6J90A08HPU/MTk1rl8RCgMmETf0rX/E20vBcbpu8VWV03AIZ7fIldKG0
	cq/cNg1iSrIR2ckZOJ/IH0X/dmW4LY4F7UFbRamR3sNngeh1M/EBox+8g8Wf5tyWI6qViqi
	BPgTfux63KfEAgCqj9VGhFFO31We3/zLbZSevPkkVp7ORNypgpKUpU9LcbtFqFL7A==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Fri, Nov 07, 2025 at 06:05:22PM +0800, Troy Mitchell wrote:
> On Fri, Nov 07, 2025 at 05:02:06PM +0800, Xuyang Dong wrote:
> > > > > > 
> > > > > >   Gentle ping. Looking forward to your reply. Thank you very much!
> > > > > 
> > > > > Please do not top post.
> > > > > 
> > > > > You did not add any maintainers of these drivers, so I would not put it
> > > > > high on our priority list. 
> > > Do you have any plans to become a maintainer? If so, this patch might get
> > > reviewed with higher priority. I think that's what Krzysztof meant.
> > > 
> > >                               - Troy
> > 
> > Hello Troy,
> > 
> > Yes, I plan to become the maintainer for this driver. I will add my 
> > maintainer information to the MAINTAINERS file in the next patch series. 
> > Would that be acceptable?
> I think yes.
> 
> And if you send next version, please dont't send to this email:
                                       ^^^^ no "don't" here..
> troy.mitchell@linux.dev instead of linux.spacemit.com.
> 
> Thanks.
> 
>                               - Troy
> > 
> > Regards,
> > Xuyang Dong
