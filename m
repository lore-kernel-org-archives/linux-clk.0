Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE5740C5CF;
	Mon, 18 May 2026 12:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779107338; cv=pass; b=re/c/+se4Ttxn4xti2xP6JrdsotHvdU7VEY6L47oHsfd4i1j3ueqhC36NJDoTgrBYTYcyE2+djgtMQG0VxapTo7HVXvUeSMUqsECHenorOVDidCooH1NJOynDzkpNXw4BEq2XzgywRsgwa1XM2JIzpb2Z31zYDdxA1Zq2th1rF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779107338; c=relaxed/simple;
	bh=3NpnMPEgIunF72GH3cGsL80kznpItztnKmXaZNN5ufo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oz4dQvOjR8g/PtOZnKK8ZwPsRlmWnrRc/p2HHQfExyhJi3PiYbUiih0sZtb0AG0TMz/oCKseVe2abPUxw+rTdc3kyuSX1LnjqnZmAymfu0UmqXohk3KwHWVXtkueJQfKyKe/y0biqTSVvaJIY6FCkqvSvTTUC9dH3LiZyz9VKDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc; spf=pass smtp.mailfrom=ziyao.cc; dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b=Iz2B02Km; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=me@ziyao.cc header.b="Iz2B02Km"
ARC-Seal: i=1; a=rsa-sha256; t=1779107313; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SW3avIO7PHhCARW3Jpr8McY4KosYnH/k83cydUhMox6tXHl4rxjLW/TKyWWrWg5IJ+pG4GdSjh4YGwMQzG9k8ZSZ6cqm1sNPUMo2HYKZT0ImZq0l2ZMW+P7AmI//T4syB/Tbi1eQRzde0VZrbm3u+xW/B2Y+wsHF+9fUVaDuxe8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779107313; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=le3jVWKWFfhs2Bh7uwp2bsCwo6wxH6tqo+u5P3QvLcI=; 
	b=OQKJKZWMGFbb4Cgr3gRGTFvDnCA6YotlSAwhvwVBZ003NSPQqRLokBpOpieLXoDZa+sLMdW5SXnJZPZo98VBpMjREDg2PjeamaIERPCKwSqivXk3beoigCUzgoxzH1EMO9BdS5oqlaGUdvvFQ3uzyh+e0FgksWCt/o+cDu4Gdgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779107313;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=le3jVWKWFfhs2Bh7uwp2bsCwo6wxH6tqo+u5P3QvLcI=;
	b=Iz2B02KmiyGXtpk2uWlB56KwnBOE2SvemmUdDzBQ7zBhSy9HbCTaRVJIc653qXAh
	H/hWun9uZpGhKPOsFScZgyHjYTYDhiWjFIPNbYisMl4X28S7dIz/eRm9Ii1LNWbTFHL
	JrVJYZ8QI3jvjvJSIH9WQtFnfoAKe0MY6IvaJTgo=
Received: by mx.zohomail.com with SMTPS id 1779107311092321.60245224509777;
	Mon, 18 May 2026 05:28:31 -0700 (PDT)
Date: Mon, 18 May 2026 12:28:19 +0000
From: Yao Zi <me@ziyao.cc>
To: Chuanhong Guo <gch981213@gmail.com>, Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
Message-ID: <agsF47bixKvB8uUk@pie>
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com>
 <20260517-popper-rage-b675785e4d28@spud>
 <CAJsYDVK+tOUZcF7rzP+og5JV2gkNS4WfGhq_hJVNvfUvQLZZrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJsYDVK+tOUZcF7rzP+og5JV2gkNS4WfGhq_hJVNvfUvQLZZrg@mail.gmail.com>
X-ZohoMailClient: External

On Mon, May 18, 2026 at 08:12:14PM +0800, Chuanhong Guo wrote:
> Hi!
> 
> On Mon, May 18, 2026 at 4:50 AM Conor Dooley <conor@kernel.org> wrote:

...

> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/siflower,sf21-topcrm.h>

Though it isn't a big problem, the include is unnecessary, either, since
you don't make use of any constants from the binding header in the
example.

> > > +    / {
> >
> > Replace this / with "soc".
> 
> Will do so in v2.
> 
> >
> > > +        #address-cells = <1>;
> > > +        #size-cells = <1>;
> > > +
> > > +        xin25m: clock-25000000 {
> > > +            compatible = "fixed-clock";
> > > +            #clock-cells = <0>;
> > > +            clock-frequency = <25000000>;
> > > +        };
> >
> > Delete this node, it's not needed in the example. The tooling will fill
> > it in.
> 
> Oh, I didn't know that. I'll drop it in v2.
> 
> >
> > Also, please test your bindings since this doesn't pass.
> >
> > pw-bot: changes-requested
> 
> It's failing on the example as root node missing "model" and "compatible".
> and it will be fixed after changing "/" to "soc".
> I'll remember to run the full dt check instead of using DT_SCHEMA_FILES
> for my single file next time.

Alternatively you could choose to drop the outer node and keep the
clock-controller node only.

> 
> -- 
> Regards,
> Chuanhong Guo

Best regards,
Yao Zi
