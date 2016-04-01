Return-Path: <khilman@baylibre.com>
Return-Path: <khilman@baylibre.com>
From: Kevin Hilman <khilman@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,  linux-clk@vger.kernel.org,  sjan@baylibre.com,  ahaslam@baylibre.com,  abailon@baylibre.com
Subject: Re: [PATCH 4/5] dt-bindings: clock: add schrodinger clock bindings
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
	<1459510635-8204-5-git-send-email-narmstrong@baylibre.com>
	<20160401161840.23150.64514@quark.deferred.io>
Date: Fri, 01 Apr 2016 11:27:25 -0700
In-Reply-To: <20160401161840.23150.64514@quark.deferred.io> (Michael
	Turquette's message of "Fri, 01 Apr 2016 09:18:40 -0700")
Message-ID: <7hh9flnq0i.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Michael Turquette <mturquette@baylibre.com> writes:

> Quoting Neil Armstrong (2016-04-01 04:37:14)
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../devicetree/bindings/clock/schrodinger.txt          | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/clock/schrodinger.txt
>> 
>> diff --git a/Documentation/devicetree/bindings/clock/schrodinger.txt b/Documentation/devicetree/bindings/clock/schrodinger.txt
>> new file mode 100644
>> index 0000000..ecb1a51
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/schrodinger.txt
>> @@ -0,0 +1,18 @@
>> +Binding for schrodinger Quantum clock sources.
>> +
>> +This binding uses the common clock binding[1].
>> +
>> +[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +
>> +Required properties:
>> +- compatible : shall be "schrodinger-clock".
>> +- #clock-cells : from common clock binding; shall be set to 0.
>> +
>> +Optional properties:
>> +- clock-output-names : From common clock binding.
>> +
>> +Example:
>> +       cat {
>> +               compatible = "schrodinger-clock";
>> +               #clock-cells = <0>;
>
> I know it is out of scope for this series, but I wonder what would
> constitute a valid status property for the cat node? Should we propose
> adding "dead" and "alive" values to the status property in ePAPR?

IMO, "dead" and "alive" could probably be mapped onto "ok" and
"disabled" without too much confusion.

However, with this series, we will clearly need to add support for
status = "both".;

Kevin
