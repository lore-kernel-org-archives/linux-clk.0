Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C326FB6
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 00:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728435269; cv=none; b=gK9uIPdQ6HsIb7lpr3nAfVtwQDVHCBbpZ6nXSXhZh7TP6/4lYdLlKF5WA1duOYwFSHwxwT5riuKKI6f63r0TceXR4wzQNE6+1ef7nrvWex19NuUTXjZOf1hoxLyyzoC4UMiAS0kJlI2YXGmEdxTZtyhS79jmGdCSHdfk7m0/32U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728435269; c=relaxed/simple;
	bh=yHmq0wYMw+LGD84FnJ5LVTtQc8XJonaPhjxS9IXe0as=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ifGUXQ+Tl2Qikt9KHxG7fPBicioMmkwWjO54fiG9fuMdH4WK1zqGPWiWhWhk10iV0bo66bJhMPdduawA2GOijGL9tQRvBYO/XdiDV1FIxtccxt2hP1U56JWLPK+jKlaoElvgh8Ub47DacfWQH1BZgGxBEorR56KCEbIIXXYuEQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Y1pY2Un3; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Y1pY2Un3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=D+HcoMNvAjebaQNx+UsZ6sCKUR0OYZnyYBIOERF1Y0w=; b=Y1pY2Un3nmIM/Ku1
	1f0dg8shryDTOnZcSXXI7rnDzO8vjzGJpeicIkMWnqOPjF7IYhEjdrbsX/GvPWWpSfs9593qWUSSO
	6XUctbS8F56AhuIqzEHbhECZBfqKTtQRLJUeKdFz1bbQ2DSZRL3D9akDmBLBSJHXRI1tJCwvLCfk9
	3AE9NNVrwYBXMbUp+OELdeE9e+XtuVBQB4FsXjzQAG7TqxubDRec3VE61RckNpDLkes9tOUXvPu8/
	/bIZyAhn9IJAQrIb2NdePvomSoF7mC5GifP2y+5UzsV+AuqbrWXtySMy3mC6q5U1B2talnv84i1ru
	lvTmroqEnfVagEAw1Q==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1syKy8-009qEI-2C;
	Wed, 09 Oct 2024 00:54:24 +0000
Date: Wed, 9 Oct 2024 00:54:24 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-clk@vger.kernel.org
Subject: Of clk_hw_unregister_fractional_divider
Message-ID: <ZwXUQOr-afniO-2u@gallifrey>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:44:21 up 153 days, 11:58,  1 user,  load average: 0.00, 0.01,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

Hi,
  One of my scripts noticed that clk_hw_unregister_fractional_divider
was unused and I was thinking of dead coding it, but thought it worth
asking whether it's actually a missing call to it.

  It was added in 2016 by:

commit 39b44cff4ad4af6d7abd9dd2acb288b005c26503
Author: Stephen Boyd <sboyd@codeaurora.org>
Date:   Sun Feb 7 00:15:09 2016 -0800

    clk: fractional-divider: Add hw based registration APIs
    
and I can see clk_hw_register_fractional_divider is called from
clk_register_fractional_divider.

Is that just consequence of them being system devices that never
get unregistered or something else?

Thanks,

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
