Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3EC153BC1
	for <linux-clk@vger.kernel.org>; Fri, 31 May 2024 11:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717153627; cv=none; b=IfPn1HmZFEqwCvq3/1fCOgNOcTQNFXnfgv43f7fXLJqjA4QNQlqDXslWYxUkcGd2VMD/p7KnpSHuQd4pvIaF2DaAZzFIjal1nbaT3BCxHvM+qdJamH5e5Nz7qE4tbTtHrk/oPLMnO4qkeqijD6J4bvZlJIkxI0B+2rkclRiAcN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717153627; c=relaxed/simple;
	bh=OJP1mreAJiN1ytAZQKPd7JRAM5wu8J5rIW3jnHr3cwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dhueVtQ+leODoDBl4+dLBsLB+6YI/Dk1ixN+uy471RxeiuR2nx9oEk7TzwDdi9jgxNQ0JUi/F2reIIx7AD4AkoTpV7gRn/7Kx+9u5lppGKAekatSc/H4+pFRwVrgDJfECIiF0qPO6QSEjQpouvuFTOL4fgR5+Z28U9Sa2uds3G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=gJp0y2Sv; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gJp0y2Sv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1717153605; x=1717758405; i=wahrenst@gmx.net;
	bh=OJP1mreAJiN1ytAZQKPd7JRAM5wu8J5rIW3jnHr3cwE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gJp0y2SvmRexD1DqR7ttusIfJ4xE35uTCKiyAFm4x01C8mlyBz12XTgU/2+DNbID
	 B1aar8SVV2x6HBMDy2pPOmvEubvtrhBec2CjDdhNprGPwnx3A57tlD4k0c5uDTpCJ
	 FgjDQJ/JW0z9gmZ8DZlPOJh9qCcXGZ1MvfBbqWYa2Sy0Bc7Qqusf21EvkrfEJo9Fh
	 bn+4Kh4tRv04VRTm8tsjQKFCBewJmXctVImg6WnsL8j7Z06O1RiXfcnY8O8c53/9g
	 4wN5Qepzfc/Gq7Bxey2lRhlUKMB6KekeKxX1MXIH2/fpewIHaInTJ3mnvVSzW4tBu
	 Z/DOM9SMMyvE0rh85A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.127] ([37.4.248.43]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M8ygO-1sAGH5010I-007E4U; Fri, 31
 May 2024 13:06:45 +0200
Message-ID: <2a9fdc2d-7fdd-439d-b8b6-406b559d27c9@gmx.net>
Date: Fri, 31 May 2024 13:06:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: bcm: rpi: Add disp clock
To: "Ivan T. Ivanov" <iivanov@suse.de>
Cc: sboyd@kernel.org, florian.fainelli@broadcom.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, Andrea della Porta <andrea.porta@suse.com>
References: <20240531092730.253484-1-iivanov@suse.de>
 <4c56e57c-7a4e-4976-a05e-0adf3df13b3f@gmx.net>
 <20240531101813.fronn47dx3ksacq6@localhost.localdomain>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20240531101813.fronn47dx3ksacq6@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2AXF/1K452SAAI57Fo9LEj8sW7lZrQdYkMt7gVBTWhhxzxXeW7d
 P31tAJIDIieLyjrImvJ4TqMta11Y9lZH0GoUi8SspGNQgRUeq5UGZaVNVRxpKG8uj5zLp9D
 EY2WBYTqmn8DsOOFtnu2k28KFBGFmK519ODIUtYhxE5mRU7YB6dQnshehzGMKj7QTyVFSUs
 GuEA/fBH6jUT8im2fAVWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Poip/PkBAZk=;D48Bfytlb12w2rRf4gzFBcpwsFS
 HMUfmehHuzr+lBoJw6lFf/+VXwfhhHn3mxxPVUjSWqWx3wFKAzbfLNpH5zHH+N/Y90lTK0Hwn
 OehjFoAb8TEsS5YtDxVL+eyHHh1bSFsdQOuEWuDd17Z35UBE0xWuXNS3ZYImdbIX1vltC/M7F
 5cZVXF5jgfc4AWkDzyAkaaEZiEU2kDWMO58YGGQaYiNp1/BzezM46wuRhG0W1Wl1Rnv8DozYK
 Mwl/qaryRTHebYij6icR0LxfVbdi71qb5EFS+2RrwOsah7B9DiJfkR1fVIPifMXU4Pded6atb
 uzYwHIrW/vUFV9WWqP1PjzrBXEJFYm85A1EweWu8Vh+P4/J9cwhSJaf4No6YouQbWJjGMoAFc
 Gffe9pqp7mQmHSPcCJw/+3uU6CbEuZ9mYifidsUusZKRqDyqn5k5AV8fMdn2DaFxv2eBQPtcl
 4a/IRDgaUlTup45Pv0Mrl9dNaYzRz63PgUGR0RkX0qgFgJdw8ZuvOjCgtBfw7wCEA2yEXfz/B
 focwluqje1nno4JAqcUtfYIthXpZa7PaAaEi5/TJEOy9hqPC2FRRJ+GAlR0yIKO3FK51hRaow
 Xz2Oa5Jse5xhcOoaaFtGYp4i/eFY6tgD6tXxsYoKbyVHnlwqw9nrIzsuEzjVno78VR/m8unl+
 Jw08gWlM4jO8kp1YYDctnK+UAMPOHf8qNxqpSIJlZ4K0NEoxfP/9tOq+47ShIx6L9dET6TWsO
 dbXAemM5nbi0342n+FCV66HyKVVbaRco94c10xyN7RNZTgI/FAXDI/5Vgx6R2InX2pHMCNor0
 RmzWuT3xbPRI6C4fXnQvU4C9eUSRo+HWbsCVu3KJ+uKhk=

Hi Ivan,

Am 31.05.24 um 12:20 schrieb Ivan T. Ivanov:
> Hi,
>
> On 05-31 11:55, Stefan Wahren wrote:
>> Hi Ivan,
>>
>> Am 31.05.24 um 11:27 schrieb Ivan T. Ivanov:
>>> From: Maxime Ripard <maxime@cerno.tech>
>>>
>>> BCM2712 has an extra clock exposed by the firmware called DISP, and us=
ed
>>> by (at least) the HVS. Let's add it to the list of clocks to register =
in
>>> Linux.
>>>
>>> Without this new definition driver fails at probe on BCM2712.
>> could you please explain the relation to Andrea's series [1]?
>>
>> How can this occur, because there is no Raspberry Pi 5 support in Mainl=
ine?
> I am using few out-of-tree drivers on top of the Andrea's patch-set
> and noticed the failure, so decided to prepare the road for RPi5.
okay and did you use the vendor DTB or Andreas' version?
> I am not entirely sure what are you asking.
Because Andreas DTS shouldn't require this patch and we usually don't
include changes which are not testable with Mainline Kernel.

Without a broader context this commit message is not self-explaining.

Best regards
>
> Regards,
> Ivan
>

