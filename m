Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C76747485;
	Sun, 20 Oct 2024 10:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729419621; cv=none; b=HIZhehHzBxA5/C+hOwpEGU6FNPtBQWtCUj+R8l9HzKYmO01T3pee0qloPBWB4/uYYUOanBNoiB+irlpUP2SCocNGP5xgpQcY5ehT71SuiymLw2zV9ex4u+e69F4h5HI1DEqO8RkVqVfHYJlVoQBmrdOkUEgMd18Ca09y82itorQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729419621; c=relaxed/simple;
	bh=5Kpkc+xkCTbzMZ/owuFbnwzrYpqhxtJpLH3RYIqT70c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bJ9mLiX+mvg7TIQLG5AjkfslcCBj0KbQejp4yvmrKPWBVH61WV7r7/v2JZpLI4XBpxAFIBqYEs0gQv3/8aoBYVPI4SfRLz+K8Ezfjc1To/e3iuycUb7mOFWlPjbdvO58zC4HNAljF8E8JpIvAr9x8tNKmL3ECZrv85f8haSXEbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EE1ADA7;
	Sun, 20 Oct 2024 03:20:43 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD5623F58B;
	Sun, 20 Oct 2024 03:20:11 -0700 (PDT)
Date: Sun, 20 Oct 2024 11:19:11 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "Ryan Walklin" <ryan@testtoast.com>
Cc: "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>, "Chen-Yu Tsai" <wens@csie.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, "Code Kipper" <codekipper@gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sun4i-codec: Add playback only flag to quirks
Message-ID: <20241020111911.61c9a758@minigeek.lan>
In-Reply-To: <87d9e653-a7d1-4611-9e9a-724bfd1be029@app.fastmail.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
	<20240929100750.860329-3-ryan@testtoast.com>
	<20241008133204.3ea38338@donnerap.manchester.arm.com>
	<87d9e653-a7d1-4611-9e9a-724bfd1be029@app.fastmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Oct 2024 19:04:24 +1300
"Ryan Walklin" <ryan@testtoast.com> wrote:

Hi Ryan,

> On Wed, 9 Oct 2024, at 1:32 AM, Andre Przywara wrote:
> 
> Hi Andre, thanks for reviewing! 
> 
> > On Sun, 29 Sep 2024 23:06:03 +1300
> > Ryan Walklin <ryan@testtoast.com> wrote:
> >  
> >> From: Marcus Cooper <codekipper@gmail.com>
> >> 
> >> Some devices only have the playback side of the codec implemented
> >> so add a quirk to check for this.  
> >
> > That's odd, is this really the only place where we need to 
> > consider the lack of sampling functionality? I mean it just prevents the
> > fields to be populated in our internal struct, how does the rest of the
> > kernel know that there is no capture? Is that magically achieved by those
> > fields being zero now?  
> 
> Yes this is only used internally by the codec driver. The playback only nature of an individual codec is communicated to the DAI when the machine driver is created, for example in sun50i_h616_codec_create_card():
> 
> 	card->dai_link->playback_only = true;
> 	card->dai_link->capture_only = false;

Ah, that makes sense indeed, I now see those lines.

Many thanks for the explanation!

Cheers,
Andre
