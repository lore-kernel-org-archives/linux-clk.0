Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634356;
	b=S2ekhT/cFq+7EVjR8d1AoGoZCpsp+oC8vvQ5Q8jhEg69CjvDqF4BHpgp5EvWBc8eIxMR
	 qWiHVXyC9vmZgx9NzcRBrnfVQG4fOjp69o9UH7drmkA6TA5cHyCzVFsW7D/Xy8DfZoUuf
	 osdmdVw6hbW2gt8a32uuVXGLuUeqsHoKUrrsNAZwe++78+7wVtaXcZBmyMIxmamxSuZOA
	 wulQ1AkdSNdxPFfvP7i1IBUA9ABbbR0RCl99b5i2jsagbKMvTOsCf2Jk/j5BBcfyA0XYV
	 174PZ+WnbgNcQfe0QaDeMLHiu2qkQJ4JXFBo1cr44CUvkG4+RNjyAHsW8YiZ8ZV1Pxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
	b=DY+vSWSbqMgu2Ve6wa8Q3h/s6w25W0vtKgkBjlvMPaliQ8QaT551ttBAiGe1kTygXl/Z
	 rTxnBHUdynbyYkHxVMUNFWMarvqfEb2mEDskVSOtXJGRy2tQS10cM8D+KqOLgnlIRGoXG
	 nKe+UXgBn9yBEh68u+skruKpDMiuxjPorsCbzktKZRVJgo0WknywrYJDzC7R9QqKSLiko
	 3aU5L97XL1v0uQrDSqOWpm6H4yqfU2WZKa2rPoEuX+Q/ny90nijzFJ42ZWqODUhdBfW6T
	 5+hGyN85j9HttmD7+kGxexg//OPTSguEpx2mkymB37sb77qMo0uRNXhrErrIrJoiQTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="AMecBw/O";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF85E606A31E
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 19:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF85E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMecBw/O
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f0213202fdso33236015ad.3
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 11:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795634355; x=1796239155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=AMecBw/OeClvoiGfo4CBS0vwu3d45iyTlSHTdmQzaMi4s/WEAxD7o+i1BbLKkhtvmY
         i/G4pf7qbzvLrWIo/CIQbAVTuhqj0fDs0YDVEdvlpSm3ii6/q5HgItZpFVr/X6pWiP6j
         8h8AqkDhyr2qybSh1bBir5+GZm7WaXm5wg1WA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634355; x=1796239155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CDQbjZRD5r2LD7/4BjsL2T12qmTPHlWO1n2mr1qyPAs=;
        b=r8SAE9IB6T2JrWgKGFAVPL74Bq+TlzWczTOczuLzvhQTM/1hI1abq3uD17P/Iw0zaz
         vQ1tCcM5j9+JBd2d37lFgeM7PUnMSbDf951LOb4EMuLbRJ4kXCVP5new34Qx/GOApnFu
         wPSS0e1xDN4yfYJnU1CEDr8LswzIA7WtB7vdLnELi2JBjFTT+nCu6wy27tQuiFLAb9OX
         ZwkRvqFtqXxrhdNXchE7Ec0jHTptvxomPXV06Zy8Q46pOsoiyuJgmr1+P7C7eZqXT2GD
         /eYeSnBS6Rj1qKfPNln5KZUIPvUOfz1aWMbPEB7R7MgLnUaB4VTitb45V59HyeeFV6Z5
         fulw==
X-Forwarded-Encrypted: i=1; AL+hErGhKWasbQAR3ZZzF2FDxOhencO6/YMbpf1MrWVjHGbosJBF809x5ht8I2+QgpFtHZmMYVhJxWoGczQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dFdC1zgkHJR+52Oq26R0B6Dj6YpQbNp+Vnnmeh9WOIwlzLxxu
	GBvFQ+7ZlElRUwTA6hN/DN44kycgH9iHNFyk6ACoYMOy95Fk5nxHvRtaCqsVWNNxJw==
X-Gm-Gg: AZFdTZc2ljElhtgu9+uLVHHiA4Z9Gl5S3zEoHkgWWzCGRJ1bab23fpUHIfMEfjSh8Qd
	7MzWn+3mPbEHxpohEWSp7Bx/N5KvcmYiOWZvad0tiOXfgthzDGaCluYTHWFhGh445MSf8WJyvUU
	QUKT4CFzzVC5Cq0D/LnHI7TcG4zcZx5FewtQcDvYKVbUUpIQkorcuRXcLD+rmzgoZYxnFEw5aOe
	yM0ZG654orzLwOL4JZiu1kb6nWFnlGdi8TY0U0v5VwTVQcpbtqyJ3bUuRxm8P4fR4T4zkAVBKE6
	cwG0uZ2uG/Lzu3/ff1W8Is88UGXZTg2ywu48AwHehbmaslhFGe5lasR0YTQ4E29CqAUs+gH9EIC
	dpN9+KT39dy9qBbuYcJURKBD5+8ifNcSvvhTH718xeob62M20hKbbNEoxtDGylt6LA/GRFGPTe5
	9pYl38M1Gf1ex7Dnx7bfSNKs/CBSgAQkuffkfi5MVnX//9FqjHfo86NQzPp7beWtrgCime0AswO
	dcBh84qA9oKICr12TOnY7OhvMWBQipf5DXz8ctQmJf2b5iuy46isHbiRdAwKnv/eU+BGnQ1UYQN
	YI/t+F9/upu7N4q9VaTESDmFF4fgcwmO+7jtcY9mvPbSoX3DhlwfHnYXDA+3vvyJx0Y=
X-Received: by 2002:a17:902:d511:b0:2f0:446d:30cd with SMTP id d9443c01a7336-2f0446d33f4mr180619865ad.31.1795634355343;
        Wed, 25 Nov 2026 11:19:15 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d0a2:f616:6ba:a1ce])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2f03ee84364sm93389045ad.5.2026.11.25.11.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 11:19:14 -0800 (PST)
Date: Wed, 25 Nov 2026 11:19:12 -0800
From: Brian Norris <briannorris@chromium.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>,
	linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: Re: [PATCH v2 5/9] reset: google: Add CPM reset driver
Message-ID: <awc0sBl6q6A2Reaq@google.com>
References: <20261125000349.3385325-1-briannorris@chromium.org>
 <20261124160343.v2.5.I0b1ad34a718a9b5f667d2481041970ea45989dd3@changeid>
 <f89e293688feb3f9bcdce0f1b6fed0ee424e5cd8.camel@pengutronix.de>
 <awbJUwrBQw5TnowW@monoceros>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awbJUwrBQw5TnowW@monoceros>

On Wed, Nov 25, 2026 at 12:43:40PM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 25, 2026 at 09:48:04AM +0100, Philipp Zabel wrote:
> > > +#include <linux/mod_devicetable.h>
> > 
> > Please include the specific <linux/device-id/*.h> that is needed
> > instead of all of <linux/mod_devicetable.h>.
> 
> Or better still, rely on the bus headers to provide the needed
> *_device_id structures. (That is <linux/platform_device.h> provides
> of_device_id (for patch #2)

Only very indirectly:

  <linux/platform_device.h>
  -> <linux/device.h>
    -> <linux/device/driver.h>
      -> <linux/device-id/of.h>

> and <linux/auxiliary_bus.h> provides
> auxiliary_device_id and of_device_id (for patches #3 - #6)).

Also quite indirectly.

I'm not sure how to take this advice. I tend to see "include what you
use" feedback (and not rely on implicit includes) elsewhere, which
suggests I should *not* do what you say here. Do I just need to guess at
when an implicit include should be deemed intentional?

At the moment, I plan to simply go with Philipp's advice, as I don't see
the harm in targeted, explicit #include.

Regards,
Brian
