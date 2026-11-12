Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.75
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794441671;
	b=lQUj1176xToSAxJv+6vPvZEj2StcojtqN6/a8zmxQ1+biQBYCLFUQ/vu+2vpfWTT9VNK
	 gD6+f3DEzfKAn3k859+VC+USVg4Q9aInNlUci/4UXIliN61BlB7R7lFKY0NXxOe362GT7
	 j+1UnK9WGrcJOhah9PsqSVhZEtdisvkdRbzPVytLgH8q3owvu20kzhd4rKQZwFFVawU7K
	 jS0s5+U0H3ohKRMZbmKHE4oQQeh77tzk68eayrZuE0IAHK/74ilpBr4KPKGqxzSs4EXi8
	 4IMwJ+bCPFTXYL60qb1KuLzvix0Luw65WS127GZX9FcbK9fC7rhoXlQhMo14xTi747A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794441671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 To:Cc:Subject:From:X-Mailer:References:In-Reply-To;
	bh=BGxV5GaAPR9OQc9tbH3qdasAzMttEnvIDguQ3NY5O90=;
	b=gMoARYUeG0toAM/d5lZ2mx1dEIQoKCIGhVyi6zE8qDcnhQNX5AJGS6jhf5tfVqtI3JY3
	 huLaomDbxmZgaBO1RofJ5B3URxTsuGjHiu6p+DVkrlvSbckOGFKWZWLpCj+w3fQWb3qF+
	 FyrzlYijFxwX8DzyvUxfo5Rk1hvc+gzOr/Jmv+6sTRjiYCelzUZta1GWG6BJ6Dgw0LLaA
	 8RRvCHiC3zb/cVUjErmvwOT8qCbgr47+kRKJI5y+PSNKK9gNljJJruVWh4J9nnkpcNQGu
	 ztBv7ST2bkjlaUhRX870JrlQYfluhXYSiq9k6f2g2ciqhso6NC2pGSnvVezrNpP+aiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoMKgKL3;
	arc=none smtp.remote-ip=74.125.225.75
Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575A1606A324
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 00:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575A1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QoMKgKL3
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-4901ac93584so1710982f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Nov 2026 16:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794441669; x=1795046469; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BGxV5GaAPR9OQc9tbH3qdasAzMttEnvIDguQ3NY5O90=;
        b=QoMKgKL3rV955BcfmYWa+kz1zAoJHeg5BXr1efXWWPYY0JbYXMz/cLzcDP0gHSPTR3
         MYJSo/8RE+0AeuYBp0DSZtsXSsBOlcOLDipbvXLljn0nXcgAuqQsixCAsJR+nSMFQxKW
         Bam5Otsx3UyWqOBpwU02V+n3mAd1qT6q3xG351GpJENyyXmH5O2GpZ5gvUNHCK6/Uq7e
         ifeZom2gExj16fIjIb40SJmr695Iz93fEMPDj+84NcsI0dA719pMs/D8q9D/Iuuz+QDK
         Ci6vZVyBmE+lb3mEc0Kshgw8M4HoStp1RY90uP8Xv/gnFe2rwGyftshM9FuUFQ08xcr6
         Vzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794441669; x=1795046469;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGxV5GaAPR9OQc9tbH3qdasAzMttEnvIDguQ3NY5O90=;
        b=Ni6XV3XJqt/wwmeg2SzF8kMVa24dv3Wx+foJ9aLJI2WOj8d9MTm3ElLwgl+jkKsPoY
         ZE43oyv6vJgVC1pCyFojRqdt7GEZW/q4H7a5abgXac7wH9/jDrUtjPxrRArHmksg7Tu1
         Gmbrm8gD6wg0kjNNx1ovY4cnVUdgpDNBO/NM+O0mC6WMJr5hgtlRbVWtOMrlMYN9DkVZ
         vrlK5uQtpFwxUPaq+SmghfOU0pECCbCTc1D5JTmmEV2qDirOdNMvlzaofKEKpMERHbbV
         /Txf2dPvdJS8UHwlRNqAKgn+ZJOVlm6OFVihkp4M12ilw8AHJWDzeY+sp3aP0Bd49neh
         Midw==
X-Forwarded-Encrypted: i=1; AL+hErFTEsnUh0078xofDnP8DIkSEqqxqL6n2l8u0NJfm2LVnICjSTEN3AUEMLlpB6M8ppCp24GDPuOLqyM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PBr0OSbb/YyTSPgyf4SmfE0eC5hWHZOvi6eHi5TQiKAGExtDx
	+Jv+R26IdJRYQparMdEF2PBPpxbggIy+cCIb4Usw7o+Z6oqfunqwL0lZhJsKYBBi69M=
X-Gm-Gg: AYBFou17Ro2gyxl5roauyOykYanE5GOHnkBCqPFur1u9hCabhZ6kRhuK7SnXmK/hgrZ
	ScEvKQKXO0zI/BsS1fuTgjYnqVYGZoAVJvCQGBgiZzO+N1BHfQ26mspZTPqx0U+5dkVIz74e3jA
	6QQnhIelT//xhTBBAMJW1iiTGK5sm6hiukhr9pyjhkkfmLGt5a+3bX2nywYNoe8Hw8AfYt/06/X
	kKBNlcp+0anjqRvuta9XbTEMXpNwZZRtV0Abq0Xi7ouvViwSVtZHriBNyLWhQ8phVpQ8nf2V5DX
	NDQGF/zonMsrmoFd8HnQqj3hVUlNRUS6Vtbp/pSjVrsXPZqnAtZd5CgpxEgKz1hY546gW2q67NG
	XUn6i/Pl5wOlUYNccMgAjhOQc2BJs8ySiSpLJydv7lF5WUu1sF+8JJOQWjIfjV6dcaZcS9P1Nmv
	DEoGlniS6ytub1QfJmoeGOcP4+kGkHOVg57h4RyvuXwa2V9hjZgeie5HtH2HK4G88LSvJN0nUAT
	60Px6RZ63z0vwVB8mAkL/2ua1mb4PrZVgi/J3KvW6cKELdjqajczkhlNqYQTLwyKGHmBkoeS+oT
	SRB+lp0FSwZPNhv63AsQN7qXTmUNabmKvbseyNbhu7scenagRDMWuZUE9WQZqKnSt/hFCF50Y9x
	jlYIPWbM/lci1X1Ectek4mij5KGUIDCJI3iXAaysjQg==
X-Received: by 2002:a05:6000:2002:b0:48e:f10:ceb8 with SMTP id ffacd0b85a97d-499c8982645mr6741108f8f.11.1794441669255;
        Wed, 11 Nov 2026 16:01:09 -0800 (PST)
Received: from localhost ([151.40.161.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbeedsm13418776f8f.43.2026.11.11.16.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 16:01:08 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 01:01:07 +0100
Message-Id: <DMSSHDUVX4J2.1YGT58MPOQYD0@linaro.org>
To: "Brian Masney" <masneyb@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>
Cc: "Tero Kristo" <kristo@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Brian Masney" <bmasney+clk@redhat.com>, "Jerome Brunet"
 <jbrunet+clk@baylibre.com>, "Tony Lindgren" <tony@atomide.com>, "Michael
 Turquette" <mturquette@linaro.org>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Rouven Czerwinski"
 <rouven.czerwinski@linaro.org>, <linux-omap@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/4] clk-816x: add sys_ck clock as sys_clkin_ck alias
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261028-patch-ektor5-dm8168-clk-v2-0-dc6bf0fabae4@linaro.org>
 <20261028-patch-ektor5-dm8168-clk-v2-4-dc6bf0fabae4@linaro.org>
 <DMI44C1VHP3L.1B6WSA5BOI6BY@linaro.org>
 <179442321741.1131744.1980930320808367339.b4-reply@b4>
In-Reply-To: <179442321741.1131744.1980930320808367339.b4-reply@b4>

Hi Brian,

On Wed Nov 11, 2026 at 7:53 PM CET, Brian Masney wrote:
> Hi Ettore,
>
> On 2026-10-30 11:48:58+01:00, Ettore Chimenti wrote:
>> On Wed Oct 28, 2026 at 4:53 PM CET, Ettore Chimenti wrote:
>>=20
>> > This patch adds a new clock alias for the DM816x system, mapping
>> > 'sys_ck' to 'sys_clkin_ck'. This change is necessary because the volta=
ge
>> > management driver searches for 'sys_ck' in these systems and fails
>> > without this alias. By including 'sys_ck' as an alias for
>> > 'sys_clkin_ck', we ensure compatibility with existing drivers that may
>> > reference 'sys_ck'.
>> >
>> > Tested-by: Andrew Goodbody <andrew.goodbody@linaro.org>
>> > Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>> > ---
>> >  drivers/clk/ti/clk-816x.c | 1 +
>> >  1 file changed, 1 insertion(+)
>> >
>> > diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
>> > index 3b8e483aec92..fe6f66fc5a05 100644
>> > --- a/drivers/clk/ti/clk-816x.c
>> > +++ b/drivers/clk/ti/clk-816x.c
>> > @@ -57,6 +57,7 @@ static struct ti_dt_clk dm816x_clks[] =3D {
>> >  	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
>> >  	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
>> >  	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
>> > +	DT_CLK(NULL, "sys_ck", "sys_clkin_ck"),
>> >  	{ .node_name =3D NULL },
>> >  };
>>=20
>> I'll drop this patch from the series. The proposed approach from Sashiko
>> seems sound and I just sent a separate patch that implements that.
>
> Will there be a follow up to this series for the clk subsystem? I don't
> see any. I haven't gone through the other patches in this series. Or are
> just the first 3 patches here what needs to be reviewed / possibly
> merged?

Actually, I was waiting for reviews on the other patches before sending
a v3 to collect R-b's.=20

However, this patch (4/4) can be skipped reviewing. It will be dropped
as I've already sent [1] (it belongs to another subsystem, so you might
have missed it).

[1]: https://lore.kernel.org/all/20261030-patch-ektor5-dm81xx-vd-v1-1-8ba90=
608c25b@linaro.org/

>
> Brian

Thanks,
Ettore

