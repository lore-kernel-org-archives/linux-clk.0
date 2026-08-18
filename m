Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958173FE64A;
	Tue, 18 Aug 2026 15:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787066042; cv=none; b=V/JG1oH3uQxhs1S8MbNUg3X6iNb8xIEOEqOJr+9pUp2CPtyrO6Tut1CTaB6LEg8CLTAJH1N1LpkEI48VcP172FYs9PXPL5tw0GE0eykf1gzUo520QRXhUwLEOlAVm7Zq14wpvH9855Jyfzh0BhuLPqDYkjImNDRV1o6Byh+8TfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787066042; c=relaxed/simple;
	bh=6MmH+kpC76+6fesPMfqkmar7ORlBB2GbNHsGo8g3f2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rq9cLhLNzZTo6pVwbz57g46Ihe/aaU0LlX/8lphyPfFccRYkKEqxLBM2lurlMzWot+eR4GHsoQ+EDQwi9jiDWalv5+VncUbAjnwperxzjdRbvp3r0CCbh6qzSkUjwWtTT6Qm2woxWA0/ZP3NVXNfkCxO5J7T8woSwhCXa2P1MSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/yy6X+s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/yy6X+s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4467E1F000E9;
	Tue, 18 Aug 2026 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787066030;
	bh=QGrdUN8bDCKbvdAa910OPuj85w1SIvc9ELdb4zlGywg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C/yy6X+sWmFj7TXxqP9dFP6G7oEPmTfl4KmedNMr3Ft7COIunCTjja9LfvBEUkt2N
	 pu1A4q5/DJSsgTsZDT2KifBihaFAneqwE7VpAba/lTCh1A5hinHrg9RrKyO55VVmQS
	 7f3olDkexReljgvP/EHhc1qfy4z4eOdgforYxtUAPD2dkOoCKJPdnX7UP2ecFbiIBX
	 UYRbSLbYlNQMP4XB5jlNWRt8VcX3xJtWpMiOi4mukza424GjsZu8DEOLK41Nz/xN0i
	 oh96azYLco4JD7YV/e58unvWtCoOniJLrXmWUdbDZKvlhdRIdx14ux3EiloJlyUoJY
	 WWVUqeGiOXWQQ==
Date: Tue, 18 Aug 2026 10:13:49 -0500
From: Rob Herring <robh@kernel.org>
To: "Chiam, Evon" <evon.chiam@altera.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <bmasney@redhat.com>, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: arm: altera: fix Agilex72 compatible
 vendor prefix
Message-ID: <20260818151349.GB1775252-robh@kernel.org>
References: <cover.1786006669.git.evon.chiam@altera.com>
 <b467b990e5290a2eccaedff826968a50fb51100a.1786006669.git.evon.chiam@altera.com>
 <20260812024937.GA616612-robh@kernel.org>
 <b027b8cf-a97b-4670-a57c-1585feccb21e@altera.com>
 <20260814173551.GC1981719-robh@kernel.org>
 <00e9e61c-e96b-47d2-b560-9a362c872a50@altera.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00e9e61c-e96b-47d2-b560-9a362c872a50@altera.com>

On Tue, Aug 18, 2026 at 04:19:22PM +0800, Chiam, Evon wrote:
> 
> 
> On 15/8/2026 1:35 am, Rob Herring wrote:
> > On Fri, Aug 14, 2026 at 04:18:59PM +0800, Chiam, Evon wrote:
> > > 
> > > 
> > > On 12/8/2026 10:49 am, Rob Herring wrote:
> > > > On Thu, Aug 06, 2026 at 05:25:01PM +0800, evon.chiam@altera.com wrote:
> > > > > From: "Chiam, Evon" <evon.chiam@altera.com>
> > > > > 
> > > > > Altera has separated from Intel. Update the Agilex72 SoC and board
> > > > > compatible strings to use the Altera vendor prefix instead of intel.
> > > > 
> > > > Sorry, without better reasoning, you are stuck with them as sashiko
> > > > pointed out.
> > > > 
> > > Sashiko’s comment on the DTS still using the intel compatible strings was
> > > based on reviewing patch 1/5 alone. Patch 4/5 moves the Agilex72 DT from
> > > arch/arm64/boot/dts/intel/ to arch/arm64/boot/dts/altera/ and updates the
> > > compatible strings to altr. With both patches applied, the bindings and DTS
> > > remain consistent.
> > > 
> > > Would you prefer that I combine the patches 1/5 and 4/5 into a single patch
> > > so the binding and DTS updates land together?
> > 
> > Moving the dts directory is fine (though that is really up to SoC
> > maintainers). Changing compatible strings is not. It is not about the
> > patch split. It is an ABI. There are exceptions though. Generally that
> > is if there is no one with the h/w or the current .dts is so incomplete
> > that anyone using the h/w will need to update their DTB anyways.
> > 
> > Rob
> 
> Thanks for clarifying.
> 
> To provide some context, Agilex72 DTS is still at an early
> stage of development, and most people do not have access to the
> hardware yet. Anyone using the current DTS would need to update their
> DTB, so changing the compatible strings at this stage should
> not cause ABI issues.

This information needs to go in the commit msg.

Rob
